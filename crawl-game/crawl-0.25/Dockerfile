# Pull base image.
FROM ubuntu:18.04

# Install prerequisites
RUN \
  apt update && apt upgrade && \
  apt install bzip2 python-minimal ncurses-term locales-all sqlite3 libpcre3 liblua5.1-0 locales autoconf build-essential lsof bison libncursesw5-dev libsqlite3-dev flex sudo libbot-basicbot-perl && \
  locale-gen en_US.UTF-8 && \
  locale-gen en_US.UTF-8 && \
  dpkg-reconfigure locales

# Create crawl-dev dirs
RUN \
  mkdir /home/crawl-dev && \
  mkdir /home/crawl-dev/logs && \
  mkdir /home/crawl-dev/run

# Download dgamelaunch
RUN \
  cd /home/crawl-dev && \
  git clone git://github.com/crawl/dgamelaunch.git && \
  git clone git://github.com/crawl/dgamelaunch-config.git && \
  git clone git://github.com/crawl/sizzell.git

# Build dgamelaunch
RUN \
  cd dgamelaunch && \
  ./autogen.sh --enable-debugfile --enable-sqlite --enable-shmem && \
  make && \
  make install && \
  cp ee virus /home/crawl/DGL/bin

