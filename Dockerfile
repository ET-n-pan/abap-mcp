FROM abap-accelerator-q:3.2.1-node22

USER root

RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir --break-system-packages mcp-proxy

EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", \
     "node", "dist/index.js"]