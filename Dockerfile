FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# Install Python and pip
RUN yum install -y python3.11 python3.11-pip && \
    ln -sf /usr/bin/python3.11 /usr/bin/python3 && \
    ln -sf /usr/bin/pip3.11 /usr/bin/pip3

# Install mcp-proxy
RUN pip3 install --no-cache-dir mcp-proxy

# Install Node.js via NodeSource (AL2023 may not have node22 in repo)
RUN curl -fsSL https://rpm.nodesource.com/setup_22.x | bash - && \
    yum install -y nodejs

# Copy extracted ABAP Accelerator
COPY abap-accelerator/ /app/abap-accelerator/

WORKDIR /app
EXPOSE 8080

CMD ["mcp-proxy", "--port", "8080", "--host", "0.0.0.0", "--", \
     "node", "/app/abap-accelerator/dist/index.js"]