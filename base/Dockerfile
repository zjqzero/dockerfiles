FROM alpine:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ADD requirements.txt /requirements.txt
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --purge python3 python3-dev libstdc++ libxslt tzdata \
                                  build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
                                  libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && python3 -m 'ensurepip' \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && pip3 install --no-cache-dir wheel numpy uwsgi supervisor -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && apk del wget python3-dev build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
               libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && rm -rf /var/cache/apk/* /tmp/* /requirements.txt

