FROM control-plane/seed:latest

MAINTAINER Memo Garcia <memo@hpe.com>

RUN git clone https://gitlab.com/memogarcia/pratai-api.git

RUN pip install -e pratai-api

ADD pratai-api.conf /etc/pratai/

CMD ["pratai-api"]
