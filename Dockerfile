FROM python:latest

RUN pip install torrentp

ADD . /root/

RUN pip install -e /root/torrent-fetcher
