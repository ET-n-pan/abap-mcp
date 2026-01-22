FROM public.ecr.aws/amazonlinux/amazonlinux:2023

RUN dnf install -y python3.13 python3.13-pip && \
    ln -sf /usr/bin/python3.13 /usr/bin/python3 && \
    ln -sf /usr/bin/pip3.13 /usr/bin/pip3

RUN pip3 install --no-cache-dir mcp-proxy

RUN dnf install -y nodejs22 && \
    ln -sf /usr/bin/node-22 /usr/bin/node

COPY abap-accelerator/ /app/abap-accelerator/

WORKDIR /app
EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", \
     "node", "/app/abap-accelerator/dist/index.js"]
