FROM ghcr.io/metatool-ai/metamcp:latest

# Install Python 3.12, Docker, Tailscale, and additional tools
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    gnupg \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y \
    python3.12 \
    python3.12-venv \
    python3.12-dev \
    docker.io \
    postgresql-client \
    && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null \
    && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update \
    && apt-get install -y tailscale \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.12 as default for UV
ENV UV_PYTHON=3.12