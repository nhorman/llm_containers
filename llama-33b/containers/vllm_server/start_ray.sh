#!/bin/bash
#
export HF_TOKEN=$(cat /run/secrets/hf_token)

if [ "$RAY_MODE" == "head" ]
then
	ray start --head --node-ip-address=${VLLM_HOST_IP} --port=6379 --dashboard-host=0.0.0.0
	while true; do
		NODE_COUNT=$(ray status | awk '/node_/ {print $0}' | wc -l)
		if [ $NODE_COUNT -ne 2 ]; then
			echo "Waiting for 2 nodes, have $NODE_COUNT"
			sleep 1
		else
			break
		fi
	done
	echo "Have 2 nodes, starting vllm with meta-llama/Llama-3.3-70B-Instruct"
	export TORCHINDUCTOR_MAX_AUTOTUNE=0
	vllm serve "meta-llama/Llama-3.3-70B-Instruct" --host 0.0.0.0 --port 3000 --tensor-parallel-size=1 --pipeline-parallel-size=2 --distributed-executor-backend ray --gpu-memory-utilization=0.7 --max-model-len=64K --enable-auto-tool-choice --tool-call-parser llama4_pythonic --trust-remote-code
else
	ray start -block --node-ip-address=${VLLM_HOST_IP} --address=${MASTER_ADDR}:6379 
fi
