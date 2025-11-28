#!/bin/bash

TORRENTS_DIR=/torrents
MOVIES_DIR=/movies

inotifywait -m $TORRENTS_DIR -e create --format '%w%f' |
while read NEWFILE
do
    if [[ "$NEWFILE" == *.torrent ]]; then
	echo "New torrent file detected: $NEWFILE"
	python torrent_download.py $NEWFILE
fi
done
