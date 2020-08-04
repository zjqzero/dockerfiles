FROM zjqzero/base:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ADD requirements.txt /requirements.txt
ADD uwsgi.ini /etc/uwsgi.ini
ADD supervisord.conf /etc/supervisord.conf
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --purge -uU python3 python3-dev build-base libstdc++ libxslt tzdata \
                                      linux-headers fortify-headers libxml2-dev libxslt-dev \
                                      libc-dev musl-dev openssl-dev zlib-dev libffi-dev git \
    && python3 -m 'ensurepip' \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && pip3 install --no-cache-dir uwsgi supervisor numpy -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir git+https://gitee.com/zjqzero/pytdx.git -i https://pypi.douban.com/simple \
    && apk del python3-dev build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
               libc-dev musl-dev openssl-dev zlib-dev libffi-dev git \
    && rm -rf /var/cache/apk/* /tmp/* /requirements.txt

WORKDIR /var/falcon

EXPOSE 5000

CMD ["/usr/bin/supervisord"]
