#!/bin/sh
set -e

# Create .env file (required by ABAP Accelerator)
touch /app/.env
cat > /app/.env << EOF
SAP_HOST=${SAP_HOST}
SAP_CLIENT=${SAP_CLIENT}
SAP_USERNAME=${SAP_USERNAME}
SAP_LANGUAGE=${SAP_LANGUAGE}
SAP_SECURE=${SAP_SECURE}
SAP_PASSWORD=${SAP_PASSWORD}
EOF

# Also write to secrets file (belt and suspenders)
echo -n "$SAP_PASSWORD" > /run/secrets/sap_password
chmod 600 /run/secrets/sap_password

# Start mcp-proxy
cd /app
exec mcp-proxy --port 8080 --host 0.0.0.0 --pass-environment node dist/index.js