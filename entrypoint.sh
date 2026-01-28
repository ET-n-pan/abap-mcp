#!/bin/sh
set -e

# Create .env file (required by ABAP Accelerator)
cat > /app/.env << EOF
SAP_HOST=${SAP_HOST}
SAP_CLIENT=${SAP_CLIENT}
SAP_USERNAME=${SAP_USERNAME}
SAP_LANGUAGE=${SAP_LANGUAGE}
SAP_SECURE=${SAP_SECURE}
SAP_PASSWORD=${SAP_PASSWORD}
EOF

cd /app
exec npx -y supergateway --stdio "node dist/index.js" --port 8080 --outputTransport streamableHttp --cors
