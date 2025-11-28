FROM python:latest

RUN apt-get update && apt-get install -y inotify-tools

ADD . /root/torrent-fetcher

WORKDIR /root/torrent-fetcher

RUN pip install -r requirements.txt

ENTRYPOINT [ "/root/run.sh" ]
