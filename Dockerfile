# syntax=docker/dockerfile:1
FROM ubuntu:20.04

RUN mkdir install
WORKDIR /root/install

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y build-essential groff less gcc make git unzip python3-pip ruby bzip2 wget curl libfreetype6 libxrender1 libfontconfig1 libusb-1.0-0 \
    && apt-get clean 

RUN add-apt-repository ppa:pmiller-opensource/ppa \
    && apt-get update -y \
    && apt-get install srecord -y \

# Install deps over pip
RUN pip3 install --upgrade pip --no-cache-dir \
    && pip3 install nrfutil awscli boto3 --no-cache-dir 


# Clean install files
WORKDIR /root
RUN rm -r -f /root/install/