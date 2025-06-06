FROM python:3.10-slim

# Install needed packages
RUN apt-get update && apt-get install -y \
    git tmux sudo \
    && apt-get clean

WORKDIR /app
COPY . .

# Install Python dependencies including Flask
RUN pip install \
    requests \
    pymongo \
    psutil \
    ping3 \
    pywebpush \
    six \
    pynacl \
    flask

# Fix for /etc/machine-id missing error
RUN echo "d3f07e6d5b624a2ab2c4e556eb123456" > /etc/machine-id

# Make server scripts executable
RUN chmod +x ./bombsquad_server && chmod +x ./dist/bombsquad_headless

# Expose BombSquad and Flask ports
EXPOSE 43210
EXPOSE 8080

# Run your original script
CMD ["./bombsquad_server"]
