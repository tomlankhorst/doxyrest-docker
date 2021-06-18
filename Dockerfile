FROM alpine

ARG DOXYREST_VERSION=2.1.2

RUN apk add rsync gcompat lua5.2-dev expat-dev \
  && ln /usr/lib/liblua-5.2.so.0 /usr/lib/liblua5.2.so.0

RUN wget https://github.com/vovkos/doxyrest/releases/download/doxyrest-${DOXYREST_VERSION}/doxyrest-${DOXYREST_VERSION}-linux-amd64.tar.xz \
  && tar -xf doxyrest-${DOXYREST_VERSION}-linux-amd64.tar.xz \
  && rsync -a doxyrest-${DOXYREST_VERSION}-linux-amd64/ /usr/local \
  && rm -r doxyrest-${DOXYREST_VERSION}-linux-amd64.tar.xz doxyrest-${DOXYREST_VERSION}-linux-amd64

ENTRYPOINT ["doxyrest"]
