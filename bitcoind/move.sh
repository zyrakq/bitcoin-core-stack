#!/bin/bash
set -e
BLK_TARGET=/mnt/ssd/core/blocks #Replace with your destination, no trailing slash

find . -name '*.dat' -type f -printf '%f\n' > tomove
while read line; do
        echo $line
        mv "$line" "$BLK_TARGET/$line"
        ln -s "$BLK_TARGET/$line" "$line"
done <tomove
rm tomove
echo Done