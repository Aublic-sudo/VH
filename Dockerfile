FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    git tmux sudo \
    && apt-get clean

WORKDIR /app

COPY . .

# ✅ Install all needed Python packages
RUN pip install requests pymongo psutil ping3

RUN chmod +x ./bombsquad_server && chmod +x ./dist/bombsquad_headless

EXPOSE 43210

CMD ["./bombsquad_server"]
