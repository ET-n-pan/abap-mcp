FROM abap-accelerator-q:3.2.1-node22

USER root

RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir --break-system-packages mcp-proxy && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", \
     "node", "dist/index.js"]