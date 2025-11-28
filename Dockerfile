FROM debian:latest

RUN apt-get update && apt-get install -y inotify-tools aria2

RUN rm -f /root/.cache/aria2/dht.dat

ADD . /root

ENTRYPOINT [ "/root/run.sh" ]
