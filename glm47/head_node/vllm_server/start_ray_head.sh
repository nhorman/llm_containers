#!/bin/bash
#
source ~/vllm-latest/bin/activate

ray start --block --head --node-ip-address=${VLLM_HOST_IP} --port=6379 --dashboard-host=0.0.0.0
