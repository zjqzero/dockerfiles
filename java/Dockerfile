FROM openjdk:11-jre

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ADD Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

WORKDIR /app

CMD ["/app/run.sh"]