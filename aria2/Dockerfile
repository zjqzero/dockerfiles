FROM alpine:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ENV ARIA2_VERSION=1.34.0

RUN set -x \

    # Prepare system

    && resolve() { echo $(apk search $1 | grep "^$1-$2" | sed -e "s/$1-//g") ; } \

    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \

    # Install packages

    && RESOLVED_ARIA2_VERSION=$(resolve aria2 $ARIA2_VERSION) \

    && apk add --no-cache \
           aria2=${RESOLVED_ARIA2_VERSION:?"Impossible to find 'aria2' in version '$ARIA2_VERSION'"} \
           ca-certificates \

    # Clean

    && rm -rf /var/cache/apk/* \

    && touch /var/run/aria2.session

ADD aria2.conf /etc/aria2.conf

EXPOSE 6800

ENTRYPOINT [ "/usr/bin/aria2c", "--conf-path=/etc/aria2.conf" ]