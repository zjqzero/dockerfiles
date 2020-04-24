FROM ubuntu:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ENV LANG C.UTF-8

ADD Shanghai /etc/localtime
ADD requirements.txt /requirements.txt
COPY set_root_pass.sh /set_root_pass.sh
COPY run.sh /run.sh

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends wget python3 python3-pip python3-dev \
                                              python3-setuptools python3-wheel libxml2-dev \
                                              build-essential openssh-server git \
    && mkdir -p /var/run/sshd \
    && echo "Asia/Shanghai" > /etc/timezone \
    && wget --no-check-certificate http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib.tar.gz \
    && tar -xvzf ta-lib.tar.gz \ 
    && cd ta-lib/ \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd .. \
    && rm -rf ta-lib.tar.gz ta-lib \
    && pip3 install --no-cache-dir numpy lxml -i https://mirrors.aliyun.com/pypi/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://mirrors.aliyun.com/pypi/simple \
    && apt purge -y wget python3-dev build-essential libxml2-dev \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* \
    && rm -rf /requirements.txt \
    && chmod +x /*.sh

EXPOSE 22 5000

CMD ["/run.sh"]
