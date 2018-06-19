FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends openjdk-8-jdk wget git curl zip && rm -rf /var/lib/apt/lists/*
RUN update-ca-certificates -f

# --------------------------------------------------
# ----- Nexell added by suker@nexell.co.kr ---------
# --------------------------------------------------
USER root

# repo install
ADD https://storage.googleapis.com/git-repo-downloads/repo /usr/local/bin/repo
RUN chmod 755 /usr/local/bin/repo

# apt-utils
#RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils && rm -rf /var/lib/apt/lists/*
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates curl && rm -rf /var/lib/apt/lists/*

# Yocto build env
RUN apt-get update && apt-get install -y gawk git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio bc
RUN apt-get update && apt-get install -y autoconf automake libtool libglib2.0-dev libarchive-dev
RUN apt-get update && apt-get install -y python-git

# others
RUN apt-get update && apt-get install -y lzop vim emacs

# cross toolchain
RUN apt-get update && apt-get install -y lynx device-tree-compiler

RUN apt-get update && apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip vim

# ssh client
# ssh-keygen necessary in docker container
RUN apt-get update && apt-get install -y openssh-server

# --------------------------------------------------

RUN apt-get update && apt-get install -y python-pip sudo
RUN pip install --upgrade pip
RUN pip install pycrypto

#RUN useradd -ms /bin/bash suker

#USER suker
#WORKDIR /home/suker
RUN useradd -m suker && echo "suker:suker" | chpasswd && adduser suker sudo

COPY .bashrc /home/suker/
COPY .dircolors /home/suker/
COPY .vimrc /home/suker/

RUN git config --global user.email "suker@nexell.co.kr"
RUN git config --global user.name "choonghyun-Jeon"

# Set the locale
RUN apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#others
RUN apt-get install -y locales iputils-ping

USER suker
