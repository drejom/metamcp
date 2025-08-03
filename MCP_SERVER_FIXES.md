# MCP Server Configuration Fixes

This document explains how to fix the common MCP server issues identified in the logs.

## Issues and Solutions

### 1. Tailscale MCP Server Error
**Error**: `Error: spawn tailscale ENOENT`
**Cause**: Tailscale CLI is not installed in the container
**Solution**: 
- The Dockerfile has been updated to install Tailscale CLI
- Rebuild the Docker image: `docker-compose build`
- Alternatively, you can configure Tailscale auth in the MCP server settings in the web interface

### 2. PubMed MCP Server Error  
**Error**: `error: a value is required for '--prerelease <PRERELEASE>' but none was supplied`
**Cause**: Missing configuration parameter
**Solution**: 
1. Go to MCP Servers in the web interface
2. Edit the PubMed server configuration
3. Add the missing `--prerelease` argument with a valid value:
   - Options: `disallow`, `allow`, `if-necessary`, `explicit`, `if-necessary-or-explicit`
   - Recommended: `if-necessary`

### 3. Hass-MCP Server Error
**Error**: `TypeError: FastMCP.__init__() got an unexpected keyword argument 'capabilities'`
**Cause**: Version compatibility issue with FastMCP library
**Solution**:
1. Update the Hass-MCP server to use a compatible version
2. Or modify the server configuration to use the correct FastMCP initialization
3. In the web interface, check the Hass-MCP server configuration and update the command/args

## Recommended Fixes

### For Tailscale
After rebuilding with the updated Dockerfile:
1. Ensure Tailscale is authenticated in your environment
2. Configure the Tailscale API key in the MCP server settings
3. Test the connection in the MCP Inspector

### For PubMed
Update the server configuration:
```json
{
  "name": "PubMed",
  "type": "STDIO", 
  "command": "uvx",
  "args": ["mcp-pubmed", "--prerelease", "if-necessary"],
  "env": {}
}
```

### For Hass-MCP
Try updating to a newer version or use an alternative Home Assistant MCP server.

## Working Servers
The following servers are working correctly:
- ✅ firecrawl-mcp
- ✅ memory  
- ✅ context7
- ✅ sequentialthinking
- ✅ github

## Next Steps
1. Rebuild the Docker image: `docker-compose build`
2. Restart the containers: `docker-compose up -d`
3. Check the live logs in the web interface
4. Test the working servers in the MCP Inspector
5. Fix individual server configurations as needed

## Testing
Once fixed, you should be able to:
- List Tailscale devices using the Tailscale MCP tools
- Search PubMed literature using the PubMed MCP tools  
- Use Home Assistant functionality (once Hass-MCP is fixed)
- Access all tools through Claude Code via the MetaMCP endpoints