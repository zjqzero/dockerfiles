FROM ubuntu:latest

# So that we can run as unprivileged user inside the container.
ADD squid.conf /etc/squid3/squid.conf
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y squid \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3128

# The following flags have to be specified when starting this container:
# -network
# Refer to -help for documentation on them.
ENTRYPOINT ["/usr/sbin/squid3", "-NYCd", "1"]