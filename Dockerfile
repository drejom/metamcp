FROM ghcr.io/metatool-ai/metamcp:latest

# Switch to root to install packages
USER root

# Install Docker CLI and browser automation dependencies (Puppeteer/Playwright)
RUN apt-get update && apt-get install -y \
    docker.io \
    # Chrome/Chromium dependencies (for Puppeteer & Playwright)
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
    # Additional dependencies for Playwright
    libgtk-3-0 \
    libgdk-pixbuf2.0-0 \
    libxshmfence1 \
    libglu1 \
    libxi6 \
    libxrender1 \
    libxcursor1 \
    libxss1 \
    libxtst6 \
    libpangocairo-1.0-0 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    # Fonts for better rendering
    fonts-liberation \
    fonts-noto-color-emoji \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3.13 for MCP tools that require it (like hass-mcp)
RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.13 \
    python3.13-venv \
    python3.13-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Python 3.13 as default for UV (required by hass-mcp and compatible with other tools)
ENV UV_PYTHON=3.13

# Switch back to nextjs user (but docker-compose overrides this to root anyway)
USER nextjs