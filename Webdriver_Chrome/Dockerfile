FROM ubuntu:latest

MAINTAINER ZhouJunQian <zjqzero@gmail.com>

COPY ./google-chrome.list /etc/apt/sources.list.d

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A040830F7FAC5991
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551


RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update

RUN apt -y install xdg-utils \
                       google-chrome-stable \
                       xvfb \
                       x11-xkb-utils \
                       xfonts-100dpi \
                       xfonts-75dpi \
                       xfonts-scalable \
                       xfonts-cyrillic \
                       wget \
                       unzip

RUN wget http://chromedriver.storage.googleapis.com/74.0.3729.6/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip && \
    rm chromedriver_linux64.zip && \
    mv chromedriver /usr/local/bin

RUN apt autoremove -y && \
    apt clean all && \
    rm -rf /tmp/* && \
    rm -rf /var/lig/apt/lists/*

CMD ["/usr/local/bin/chromedriver"]
