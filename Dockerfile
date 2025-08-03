FROM ghcr.io/metatool-ai/metamcp:latest

# Install Tailscale CLI for network connectivity
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Install Python 3.12, Docker, and additional tools
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y \
    python3.12 \
    python3.12-venv \
    python3.12-dev \
    docker.io \
    postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.12 as default for UV
ENV UV_PYTHON=3.12