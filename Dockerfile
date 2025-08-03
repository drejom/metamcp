FROM ghcr.io/metatool-ai/metamcp:latest

# Switch to root to install packages
USER root

# Install Docker CLI for container management
RUN apt-get update && apt-get install -y \
    docker.io \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3.13 for MCP tools that require it (like hass-mcp)
RUN apt-get update && apt-get install -y \
    software-properties-common \
    gnupg \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 \
    && echo "deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu jammy main" > /etc/apt/sources.list.d/deadsnakes.list \
    && apt-get update && apt-get install -y \
    python3.13 \
    python3.13-venv \
    python3.13-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Python 3.13 as default for UV (required by hass-mcp and compatible with other tools)
ENV UV_PYTHON=3.13

# Switch back to nextjs user (but docker-compose overrides this to root anyway)
USER nextjs