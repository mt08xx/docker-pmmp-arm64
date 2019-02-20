#!/bin/sh

if [ ! -f /data/PocketMine-MP.phar ] || [ ! -f /data/start.sh ]; then
	echo Get PocketMine-MP.phar and start.sh
	rm -f /data/PocketMine-MP.phar /data/start.sh
	wget -q https://github.com/pmmp/PocketMine-MP/releases/download/3.6.2/PocketMine-MP.phar -O /data/PocketMine-MP.phar
	wget -q https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.sh -O /data/start.sh && \
		  chmod +x /data/start.sh
fi

/data/start.sh
