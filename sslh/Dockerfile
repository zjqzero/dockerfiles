FROM alpine:latest
MAINTAINER zhoujunqian <zjqzero@gmail.com>

ENV SSH_HOST localhost
ENV SSH_PORT 22
ENV HTTP_HOST localhost
ENV HTTP_PORT 8080
ENV HTTPS_HOST localhost
ENV HTTPS_PORT 443
ENV ANY_HOST localhost
ENV ANY_PORT 6188

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
	&& apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing sslh \
	&& rm -rf /var/cache/apk/*

CMD sslh -f -u root -p 0.0.0.0:80 --ssh $SSH_HOST:$SSH_PORT --http $HTTP_HOST:$HTTP_PORT --tls $HTTPS_HOST:$HTTPS_PORT --anyprot $ANY_HOST:$ANY_PORT

EXPOSE 80