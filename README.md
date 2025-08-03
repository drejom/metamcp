# MetaMCP Custom Deployment

A lightweight deployment configuration for MetaMCP with custom dependencies.

## What this contains

This repository contains a minimal setup for deploying MetaMCP with custom dependencies:

- **Dockerfile**: Extends the official MetaMCP image (`ghcr.io/metatool-ai/metamcp:latest`) with additional tools
- **docker-compose.yml**: Production deployment configuration
- **GitHub Actions**: Automated builds and pushes to `ghcr.io/drejom/metamcp:latest`

## Custom Dependencies

This setup adds the following to the base MetaMCP image:
- **Tailscale CLI** for secure networking
- **PostgreSQL client tools** for database operations

The core MetaMCP functionality comes from the official upstream image, ensuring you automatically receive updates and improvements.

## Quick Start

1. Copy `example.env` to `.env` and configure your environment variables:
   ```bash
   cp example.env .env
   ```

2. Deploy with Docker Compose:
   ```bash
   docker-compose up -d
   ```

## Deployment Pipeline

GitHub Actions automatically:
- Builds the custom Dockerfile when you push to `main` or create version tags
- Pushes the resulting image to `ghcr.io/drejom/metamcp:latest`
- Can be deployed via Dokploy or any container orchestration system

## Why This Approach?

This lightweight approach provides several benefits over maintaining a full fork:
- **Automatic upstream updates**: Base MetaMCP improvements are inherited automatically
- **Minimal maintenance**: Only need to manage your specific customizations
- **Fast builds**: Only installing additional dependencies, not rebuilding the entire application
- **Clear separation**: Your customizations vs upstream MetaMCP code

## About MetaMCP

MetaMCP is a powerful MCP proxy that aggregates multiple MCP servers into a unified interface. For complete documentation, features, and usage instructions, visit:

- **Documentation**: https://docs.metamcp.com
- **Official Repository**: https://github.com/metatool-ai/metamcp
- **Discord Community**: https://discord.gg/mNsyat7mFX

## License

MIT - Same as the upstream MetaMCP project.