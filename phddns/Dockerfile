FROM ubuntu:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ENV LANG C.UTF-8

ADD Shanghai /etc/localtime
COPY run.sh /run.sh
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends wget\
    && wget --no-check-certificate https://hsk.oray.com/download/download?id=7 -O phddns.deb \
    && apt install -y ./phddns.deb \
    && chmod 755 /run.sh \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf phddns.deb \
    && apt purge -y wget \
    && apt autoremove -y --purge \
    && rm -rf phddns.deb \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/*

CMD ["/run.sh"]

# 运行花生壳需要共享host网络, --net host