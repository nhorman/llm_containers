#!/bin/bash
#
source ~/vllm-latest/bin/activate

if [ "$RAY_MODE" == "head" ]
then
	ray start --block --head --node-ip-address=${VLLM_HOST_IP} --port=6379 --dashboard-host=0.0.0.0
else
	ray start --block --node-ip-address=${VLLM_HOST_IP} --address=${MASTER_ADDR}:6379 
fi
