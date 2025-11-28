FROM debian:latest

RUN apt-get update && apt-get install inotify-tools aria2c

ADD . /root

ENTRYPOINT [ "/root/run.sh" ]
