FROM abap-accelerator-q:3.2.1-node22

USER root

RUN apk add --no-cache python3 py3-pip && \
    pip3 install --no-cache-dir --break-system-packages mcp-proxy

# Create secrets directory
RUN mkdir -p /run/secrets

EXPOSE 8080

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]