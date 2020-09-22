# ARGS
ARG crawlversion

# Pull base image.
FROM ubuntu:18.04

# Install prerequisites
RUN \
  apt-get --yes update && apt-get --yes upgrade && \
  apt-get --yes install bzip2 python-minimal ncurses-term locales-all sqlite3 libpcre3 liblua5.1-0 locales autoconf build-essential lsof bison libncursesw5-dev libsqlite3-dev flex sudo libbot-basicbot-perl git && \
  locale-gen en_US.UTF-8 && \
  dpkg-reconfigure locales

# Create crawl-dev dirs
RUN \
  mkdir /home/crawl-dev && \
  mkdir /home/crawl-dev/logs && \
  mkdir /home/crawl-dev/run

# Download and build dgamelaunch
RUN \
  cd /home/crawl-dev && \
  git clone git://github.com/crawl/dgamelaunch.git && \
  git clone git://github.com/crawl/dgamelaunch-config.git && \
  git clone git://github.com/crawl/sizzell.git && \
  cd dgamelaunch && \
  ./autogen.sh --enable-debugfile --enable-sqlite --enable-shmem && \
  make && \
  make install && \
  cp ee virus /bin

# Create directories
RUN \
  cd / && \
  mkdir crawl-master && \
  mkdir crawl-master/webserver/ && \
  mkdir crawl-master/webserver/run/ && \
  mkdir crawl-master/webserver/sockets/ && \
  mkdir crawl-master/webserver/templates/ && \
  mkdir dgldir && \
  mkdir dgldir/data/ && \
  mkdir dgldir/dumps/ && \
  mkdir dgldir/morgue/ && \
  mkdir dgldir/rcfiles/ && \
  mkdir dgldir/ttyrec/ && \
  mkdir dgldir/data/menus/ && \
  mkdir dgldir/inprogress/

# Create crawl version specific directories
RUN \
  mkdir dgldir/inprogress/${crawlversion}-sprint/ && \
  mkdir dgldir/inprogress/${crawlversion}-tut/ && \
  mkdir dgldir/inprogress/${crawlversion}-zotdef/ && \
  mkdir dgldir/inprogress/${crawlversion}/ && \
  mkdir dgldir/rcfiles/${crawlversion}/ && \
  mkdir dgldir/data/${crawlversion}-settings/