FROM ubuntu:latest

MAINTAINER zjqzero <zjqzero@gmail.com>

ADD Shanghai /etc/localtime
ENV LANG C.UTF-8
ENV QT_QPA_PLATFORM=offscreen
COPY requirements.txt /requirements.txt

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends python3 python3-pip python3-dev python3-setuptools \
                                              phantomjs git wget build-essential libcurl4 libxml2-dev \
                                              libxmlsec1-dev libcurl4-openssl-dev libssl-dev \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir git+https://github.com/binux/pyspider.git -i https://pypi.douban.com/simple \
    && apt purge -y python3-dev git wget build-essential libcurl4-openssl-dev libssl-dev libxml2-dev libxmlsec1-dev \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/*

ENTRYPOINT ["pyspider"]

EXPOSE 5000