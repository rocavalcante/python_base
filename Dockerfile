FROM ubuntu:18.04

LABEL maintaner="Rodrigo Cavalcante <rodrigoibka@gmail.com>"

RUN export LC_ALL=C.UTF-8
RUN export LANG=C.UTF-8

RUN apt-get update -qq && apt-get install -y -q --no-install-recommends \
    libgconf2-4 libnss3 libxss1 software-properties-common wget \
    fonts-liberation libappindicator1 xdg-utils \
    curl unzip wget build-essential \
    xvfb \
    apt-transport-https \
    libssl-dev \
    rsync \
    devscripts \
    autoconf \
    ssl-cert \
    zlibc

#install via apt (less time)
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install python3.7 python-pip python3-pip -y

#update pip
RUN python3.7 -m pip install pip --upgrade && \
    python3.7 -m pip install wheel 


RUN pip install pyvirtualdisplay \
    virtualenv pipenv p4python pycrypto pycryptodome

#define python3.7 as default
RUN rm -rfv /usr/bin/python && ln -s /usr/bin/python3.7 /usr/bin/python

#Clear cache
RUN rm -rf /var/lib/apt/lists/*
