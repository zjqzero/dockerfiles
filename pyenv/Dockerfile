FROM python:slim

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ENV LANG C.UTF-8

ADD requirements.txt /requirements.txt
COPY set_root_pass.sh /set_root_pass.sh
COPY run.sh /run.sh

RUN sed -i "s@http://deb.debian.org@https://mirrors.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://security.debian.org@https://mirrors.huaweicloud.com@g" /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends wget build-essential openssh-server git \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && mkdir -p /var/run/sshd \
    && wget --no-check-certificate http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib.tar.gz \
    && tar -xvzf ta-lib.tar.gz \ 
    && cd ta-lib/ \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd .. \
    && rm -rf ta-lib.tar.gz ta-lib \
    && pip3 install --no-cache-dir numpy lxml -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && apt purge -y wget build-essential \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* \
    && rm -rf /requirements.txt \
    && chmod +x /*.sh

EXPOSE 22 5000

CMD ["/run.sh"]
