# Use official Python image
FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git tmux sudo \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install pymongo psutil ping3

# Set permissions
RUN chmod +x ./bombsquad_server && chmod +x ./dist/bombsquad_headless

# Expose the server port
EXPOSE 43210

# Start command (use tmux if needed, but not necessary in containers)
CMD ["./bombsquad_server"]
