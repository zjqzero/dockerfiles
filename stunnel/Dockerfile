FROM ubuntu:19.10

# So that we can run as unprivileged user inside the container.
ADD Shanghai /etc/localtime

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends stunnel4 \
    && rm -rf /var/lib/apt/lists/* /tmp \
    && sed -i s/ENABLED=0/ENABLED=1/ /etc/default/stunnel4 

EXPOSE 5000

# The following flags have to be specified when starting this container:
# -network
# Refer to -help for documentation on them.
CMD ["/usr/bin/stunnel4", "/etc/stunnel/stunnel.conf"]
