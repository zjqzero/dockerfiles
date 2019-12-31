FROM alpine:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ADD requirements.txt /requirements.txt
ADD uwsgi.ini /etc/uwsgi.ini
ADD supervisord.conf /etc/supervisord.conf
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache python3 libstdc++ libxslt tzdata \
                          python3-dev build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
                          libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && pip3 install --no-cache-dir uwsgi supervisor numpy -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && pip3 install https://github.com/rainx/pytdx/archive/master.zip \
    && apk del python3-dev build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
               libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && rm -rf /var/cache/apk/* /tmp/* /requirements.txt

WORKDIR /var/falcon

EXPOSE 5000

CMD ["/usr/bin/supervisord"]