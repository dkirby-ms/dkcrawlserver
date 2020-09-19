#!/bin/bash
mount --bind /proc/ /home/crawl/DGL/proc/
mount --bind /dev/pts/ /home/crawl/DGL/dev/pts/
/etc/init.d/ssh start
/etc/init.d/webtiles start