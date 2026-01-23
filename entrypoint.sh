#!/bin/sh
set -e

# Write password from env var to secrets file (required by ABAP Accelerator)
if [ -n "$SAP_PASSWORD" ]; then
    echo -n "$SAP_PASSWORD" > /run/secrets/sap_password
    chmod 600 /run/secrets/sap_password
    # Clear the env var for security
    unset SAP_PASSWORD
fi

# Start mcp-proxy wrapping the ABAP accelerator
exec mcp-proxy --port 8080 --host 0.0.0.0 -- node dist/index.js