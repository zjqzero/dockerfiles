FROM ubuntu:latest

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install --no-install-recommends polipo \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/*

EXPOSE 8123