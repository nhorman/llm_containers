#!/bin/bash
#

hf auth login --token $(cat /run/secrets/hf_token)

/bin/ollama serve
