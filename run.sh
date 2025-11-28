#!/bin/bash

TORRENTS_DIR=/torrents
MOVIES_DIR=/movies

inotifywait -m $TORRENTS_DIR -e create --format '%w%f' |
while read NEWFILE
do
    if [[ "$NEWFILE" == *.torrent ]]; then
	echo "New torrent file detected: $NEWFILE"
	echo "aria2c --seed-time=0 -d $MOVIES_DIR $NEWFILE"
	python /root/download.py $NEWFILE
    fi
done
