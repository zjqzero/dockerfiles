FROM alpine:3.11

MAINTAINER zhoujunqian <zjqzero@gmail.com>

COPY config.yml /etc/tailon/config.yml
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add python py-pip grep gawk \
    && pip install tailon -i https://pypi.douban.com/simple \
    && rm -rf /var/cache/apk/*

EXPOSE 80

CMD ["tailon", "-c", "/etc/tailon/config.yml"]
