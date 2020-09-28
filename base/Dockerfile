FROM python:alpine

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ADD requirements.txt /requirements.txt
RUN sed -i "s@http://dl-cdn.alpinelinux.org/@https://mirrors.huaweicloud.com/@g" /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --purge -uU build-base libstdc++ libxslt tzdata \
                                      linux-headers fortify-headers libxml2-dev libxslt-dev \
                                      libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && pip3 install --no-cache-dir numpy uwsgi supervisor -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && apk del build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
               libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && rm -rf /var/cache/apk/* /tmp/* /requirements.txt

