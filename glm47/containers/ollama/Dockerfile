FROM ollama/ollama

RUN apt update && apt -y install python3 curl python3.12-venv

RUN curl -LsSf https://hf.co/cli/install.sh | bash

ENV PATH="/your/new/path:${PATH}"
