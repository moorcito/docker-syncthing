FROM alpine:latest

MAINTAINER moorcito

RUN adduser -D syncthing
RUN mkdir /syncthing-bootstrap

USER syncthing
WORKDIR /home/syncthing

RUN mkdir syncthing-files
RUN wget https://github.com/syncthing/syncthing/releases/download/v1.1.1/syncthing-linux-amd64-v1.1.1.tar.gz -O syncthing.tgz
RUN tar xvf syncthing.tgz -C syncthing-files --strip-components=1

CMD /home/syncthing/syncthing-files/syncthing --gui-address 0.0.0.0:8384

EXPOSE 8384 22000
