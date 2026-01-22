FROM python:3.11-slim

RUN pip install --no-cache-dir mcp-proxy

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY abap-accelerator/ /app/abap-accelerator/

WORKDIR /app
EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", \
     "node", "/app/abap-accelerator/dist/index.js"]