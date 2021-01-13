FROM zjqzero/base:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ADD requirements.txt /requirements.txt
ADD uwsgi.ini /etc/uwsgi.ini
ADD supervisord.conf /etc/supervisord.conf
RUN apk update \
    && apk add --no-cache --purge -uU build-base libstdc++ libxslt libxslt-dev libxml2-dev \
                                      linux-headers fortify-headers poppler-utils poppler-data \
                                      libc-dev musl-dev openssl-dev zlib-dev libffi-dev tzdata \
    && pip3 install --no-cache-dir numpy uwsgi supervisor -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && apk del build-base linux-headers fortify-headers libxml2-dev libxslt-dev \
               libc-dev musl-dev openssl-dev zlib-dev libffi-dev \
    && rm -rf /var/cache/apk/* /tmp/* /requirements.txt

WORKDIR /var/hound

EXPOSE 5000

CMD ["/usr/local/bin/supervisord"]
