# Pull base image.
FROM ubuntu:18.04

# Create users
RUN \
  adduser crawl && \
  adduser crawl-dev && \
  id -u crawl > /root/crawluid && \
  id -g crawl > /root/crawlgid && \
  id -u crawl-dev > /root/crawl-devuid && \
  id -g crawl-dev > /root/crawl-devgid && \
  usermod -G root -a crawl && \
  usermod -G root -a crawl-dev && \
  usermod -G www-data -a crawl && \
  usermod -G www-data -a crawl-dev && \
  usermod -G crawl -a root && \
  usermod -G crawl -a www-data && \
  usermod -G crawl-dev -a root && \
  usermod -G crawl-dev -a www-data

# Set up chroot
RUN \
  debootstrap bionic /home/crawl/DGL/ && \
  cp /etc/resolv.conf /home/crawl/DGL/etc/resolv.conf && \
  cp /etc/apt/sources.list /home/crawl/DGL/etc/apt/

# Install prerequisites
RUN \
  chroot /home/crawl/DGL && \
  apt update && apt upgrade && \
  apt install bzip2 python-minimal ncurses-term locales-all sqlite3 libpcre3 liblua5.1-0 locales autoconf build-essential lsof bison libncursesw5-dev libsqlite3-dev flex sudo libbot-basicbot-perl && \
  locale-gen en_US.UTF-8 && \
  locale-gen en_US.UTF-8 && \
  dpkg-reconfigure locales && \
  adduser crawl && \
  adduser crawl-dev && \
  CRAWLUID=$(cat /root/crawluid); && \
  CRAWLGID=$(cat /root/crawlgid); && \
  CRAWLDEVUID=$(cat /root/crawl-devuid); && \
  CRAWLDEVGID=$(cat /root/crawl-devgid); && \
  usermod -u $CRAWLUID crawl && \
  groupmod -g $CRAWLGID crawl && \
  usermod -u $CRAWLDEVUID crawl-dev && \
  groupmod -g $CRAWLDEVGID crawl-dev && \
  exit && \
  chmod 666 /home/crawl/DGL/dev/ptmx

# Create crawl-dev dirs
RUN \
  su crawl-dev && \
  mkdir /home/crawl-dev/logs && \
  mkdir /home/crawl-dev/run

# Download dgamelaunch
RUN \
  cd && \
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

# Configure sudo access
# RUN \
#   sudo visudo \
#   crawl-dev ALL=(root) NOPASSWD: \
#   /home/crawl-dev/dgamelaunch-config/bin/dgl, \
#   /home/crawl/DGL/sbin/install-trunk.sh, \
#   /home/crawl/DGL/sbin/install-stable.sh, \
#   /etc/init.d/webtiles, \
#   /home/crawl/DGL/sbin/remove-trunks.sh