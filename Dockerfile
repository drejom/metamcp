FROM ghcr.io/metatool-ai/metamcp:latest

# Switch to root to install packages
USER root

# Install Docker CLI and Chrome/Puppeteer dependencies
RUN apt-get update && apt-get install -y \
    docker.io \
    # Chrome/Puppeteer dependencies
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libatspi2.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libxcb1 \
    libxkbcommon0 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Python 3.12 as default for UV (if needed by MCP tools)
ENV UV_PYTHON=3.12

# Switch back to nextjs user (but docker-compose overrides this to root anyway)
USER nextjs