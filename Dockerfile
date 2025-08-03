FROM ghcr.io/metatool-ai/metamcp:latest

# Switch to root to install packages
USER root

# Install Docker CLI for container management (MetaMCP needs this)
RUN apt-get update && apt-get install -y docker.io && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Python 3.12 as default for UV (if needed by MCP tools)
ENV UV_PYTHON=3.12

# Switch back to nextjs user (but docker-compose overrides this to root anyway)
USER nextjs