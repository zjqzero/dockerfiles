FROM ubuntu:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt -y purge rsyslog \
    && apt -y install syslog-ng-core \
    && rm -rf /var/apt/lib/lists/*

ADD syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

EXPOSE 514

CMD ["/usr/sbin/syslog-ng", "-F", "-f", "/etc/syslog-ng/syslog-ng.conf"]