FROM python:3.10-slim

# Install basic packages
RUN apt-get update && apt-get install -y \
    git tmux sudo \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy all server files into container
COPY . .

# Install all required Python packages
RUN pip install \
    requests \
    pymongo \
    psutil \
    ping3 \
    pywebpush \
    six \
    pynacl

# Make necessary files executable
RUN chmod +x ./bombsquad_server && chmod +x ./dist/bombsquad_headless

# Expose BombSquad server port
EXPOSE 43210

# Start the BombSquad server
CMD ["./bombsquad_server"]
