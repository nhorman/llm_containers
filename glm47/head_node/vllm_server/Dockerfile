FROM nvcr.io/nvidia/vllm:26.04-py3

RUN python -m venv ~/vllm-latest
RUN source ~/vllm-latest/bin/activate && pip install vllm transformers ray[default]

COPY ./start_ray_head.sh /
RUN chmod 755 /start_ray_head.sh

ENTRYPOINT ["/start_ray_head.sh"]
