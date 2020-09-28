FROM python:alpine

MAINTAINER zhoujunqian <zjqzero@gmail.com>

COPY config.yml /etc/tailon/config.yml
RUN sed -i "s@http://dl-cdn.alpinelinux.org/@https://mirrors.huaweicloud.com/@g" /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --purge -uU grep gawk \
    && pip install tailon -i https://pypi.douban.com/simple \
    && rm -rf /var/cache/apk/*

EXPOSE 80

CMD ["tailon", "-c", "/etc/tailon/config.yml"]
