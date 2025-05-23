FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y software-properties-common python3.10 python3.10-venv python3.10-dev python3-pip tmux curl git unzip && \
    apt clean

RUN pip3 install pymongo psutil ping3 discord.py

WORKDIR /app

COPY . .

RUN chmod +x bombsquad_server dist/bombsquad_headless

EXPOSE 43210/udp

CMD ["./bombsquad_server"]
