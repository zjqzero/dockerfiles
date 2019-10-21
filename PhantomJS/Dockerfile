FROM ubuntu:latest

MAINTAINER ZhouJunQian <zjqzero@gmail.com>

ENV PHANTOMJS_VERSION 2.1.1

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt -y install libfreetype6 libfontconfig wget \
    && wget --no-check-certificate --no-proxy -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
    && tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp \
    && rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
    && mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin \
    && apt autoremove -y \
    && apt clean all \
    && rm -rf /tmp/*

CMD ["/usr/bin/phantomjs"]
