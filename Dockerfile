ARG UBUNTU_VERSION=noble
FROM ubuntu:${UBUNTU_VERSION}
ARG RSYNC_VERSION=3.2.7
RUN apt update
RUN apt install -y curl openssh-client build-essential gcc g++ gawk autoconf \
  automake python3-cmarkgfm acl libacl1-dev attr libattr1-dev libxxhash-dev \
  libzstd-dev liblz4-dev libssl-dev

RUN curl -X GET -s -o rsync-${RSYNC_VERSION}.tar.gz \
  https://www.samba.org/ftp/rsync/src/rsync-${RSYNC_VERSION}.tar.gz && \
  tar -xvf rsync-${RSYNC_VERSION}.tar.gz

RUN cd rsync-${RSYNC_VERSION} && \
  ./configure && \
  make && \
  make install

ENTRYPOINT ["rsync"]
