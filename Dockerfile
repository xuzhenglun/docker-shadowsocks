# shadowsocks
#
# VERSION 0.0.3

FROM ubuntu
MAINTAINER Reficul <xuzhenglun@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip
RUN pip install shadowsocks==2.8.2

ARG METHOD
ARG PASSWORD
ARG PORT
ARG OTA
ARG UDP

RUN echo "Password:${PASSWORD}\nMethod:${METHOD}\nPort:${PORT}\nOTA:${OTA:+"-A"}\nUDP:${UDP:+"-u"}"

EXPOSE ${PORT}

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/ssserver","-s 0.0.0.0","-m ${METHOD}","-p ${PORT}","-k {PASSWORD}","${OTA:+"-A"}","${UDP:+"-u"}"]
