FROM public.ecr.aws/docker/library/node:22-slim

RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir --break-system-packages mcp-proxy && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY abap-accelerator/ /app/abap-accelerator/

WORKDIR /app
EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", \
     "node", "/app/abap-accelerator/dist/index.js"]