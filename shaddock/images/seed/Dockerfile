FROM ubuntu:16.04

MAINTAINER Memo Garcia <memo@hpe.com>

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get -y dist-upgrade && apt-get install -y wget python3.5 python3-pip python3-dev git

RUN pip3 install pip --upgrade

RUN wget https://github.com/zeromq/zeromq3-x/releases/download/v3.2.5/zeromq-3.2.5.tar.gz

RUN tar -xvf zeromq-3.2.5.tar.gz

RUN cd zeromq-3.2.5

RUN ./configure && make && make install

RUN mkdir /etc/pratai/

RUN mkdir /var/log/pratai/

ADD cloud-config /usr/local/bin/

RUN chmod +x /usr/local/bin/cloud-config

CMD ["cloud-config"]
