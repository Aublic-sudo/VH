FROM python:3.10-slim

# Labels (optional)
LABEL maintainer="yourname@domain.com"
LABEL description="Modded BombSquad server with auto dependencies"

# System packages
RUN apt-get update && apt-get install -y \
    git tmux sudo curl \
    && apt-get clean

# Set work dir
WORKDIR /app

# Copy all local files to Docker image
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir \
    requests \
    pymongo \
    psutil \
    ping3 \
    pywebpush \
    six \
    pynacl \
    flask \
    discord.py

# Fix missing machine-id issue
RUN echo "d3f07e6d5b624a2ab2c4e556eb123456" > /etc/machine-id

# Make executables
RUN chmod +x bombsquad_server dist/bombsquad_headless

# Expose game and API ports
EXPOSE 43210 8080

# Start BombSquad server
CMD ["./bombsquad_server"]
