FROM ubuntu:latest

MAINTAINER zhoujunqian <zjqzero@gmail.com>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

ADD Shanghai /etc/localtime
ADD start.sh /start.sh
ADD requirements.txt /requirements.txt
ADD key.pem /key.pem
ADD custom.css /root/.jupyter/custom/custom.css
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
ADD matplotlibrc /matplotlibrc

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y --no-install-recommends wget language-pack-zh-hans-base graphviz \
    && locale-gen en_US.UTF-8 \
    && chmod 755 start.sh \
    && apt install -y --no-install-recommends build-essential python3 python3-dev python3-pip python3-setuptools qpdf \
    && pip3 install --no-cache-dir jupyter ipython numpy -i https://pypi.douban.com/simple \
    && pip3 install --no-cache-dir jupyter_contrib_nbextensions -i https://pypi.douban.com/simple \
    && jupyter contrib nbextension install --user \
    && wget --no-check-certificate http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib.tar.gz \
    && tar -xvzf ta-lib.tar.gz \
    && cd ta-lib/ \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd .. \
    && rm -rf ta-lib.tar.gz ta-lib \
    && pip3 install --no-cache-dir -r /requirements.txt -i https://pypi.douban.com/simple \
    && mv /matplotlibrc /usr/local/lib/python3.8/dist-packages/matplotlib/mpl-data/matplotlibrc \
    && wget --no-check-certificate http://d.xiazaiziti.com/en_fonts/fonts/s/SimSun.ttf \
    && mv SimSun.ttf /usr/local/lib/python3.8/dist-packages/matplotlib/mpl-data/fonts/ttf/SimSum.ttf \
    && apt purge -y wget build-essential python3-dev \
    && apt autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* \
    && rm -rf /requirements.txt

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

CMD ["/start.sh"]
