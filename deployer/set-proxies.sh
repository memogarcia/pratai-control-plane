#!/usr/bin/env bash

set -x

HOST_IPS=$(hostname -I)
HOST_IPS=$(echo $HOST_IPS)
HOST_IPS=$(echo $HOST_IPS|sed 's/ /,/')

if [ "$1" == "P-R-O-X-Y" ]; then
    exit 0;
fi

# Proxy goes here
PROXY="$1"

sudo cat >> /etc/environment << E-O-L
export http_proxy=$PROXY
export https_proxy=$PROXY
export HTTP_PROXY=$PROXY
export HTTPS_PROXY=$PROXY
export no_proxy=127.0.0.1,localhost,$HOST_IPS
export NO_PROXY=127.0.0.1,localhost,$HOST_IPS
E-O-L

sudo cat > /etc/apt/apt.conf.d/01proxies << E-O-L
Acquire::http::proxy "$PROXY";
Acquire::https::proxy "$PROXY";
E-O-L

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git-core -y

git config --global http.proxy $PROXY
git config --global https.proxy $PROXY

sudo apt-get install -y docker.io

sudo cat > /etc/default/docker << E-O-L
DOCKER_OPTS='-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock'
export http_proxy="$PROXY"
export https_proxy="$PROXY"
E-O-L


sudo service docker restart

exit 0;
