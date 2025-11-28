# FROM debian:latest
FROM python:latest

RUN apt-get update && apt-get install -y inotify-tools

RUN pip install torrentp

ADD . /root

ENTRYPOINT [ "/root/run.sh" ]
