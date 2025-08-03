FROM ghcr.io/metatool-ai/metamcp:latest

# Set Python 3.12 as default for UV (if needed by MCP tools)
ENV UV_PYTHON=3.12