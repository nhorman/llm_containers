FROM nvcr.io/nvidia/vllm:25.11-py3

COPY ./start_ray.sh /
RUN chmod 755 /start_ray.sh

ENTRYPOINT ["/start_ray.sh"]
