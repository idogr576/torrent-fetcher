#!/bin/bash

TORRENTS_DIR=/torrents
MOVIES_DIR=/movies

inotifywait -m $TORRENTS_DIR -e create --format '%w%f' |
while read NEWFILE
do
    if [[ "$NEWFILE" == *.torrent ]]; then
	echo "New torrent file detected: $NEWFILE"
	echo "aria2c --seed-time=0 -d $MOVIES_DIR $NEWFILE"
	test -e $NEWFILE && echo 'confirmed file exists'
	aria2c --seed-time=0 -d $MOVIES_DIR $NEWFILE
    fi
done
