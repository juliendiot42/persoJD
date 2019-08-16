#!/bin/bash

SOURCE="/path/to/source/"
DEST="/path/to/destination/"
# do not forget the "/" at the end of the paths source and destination

while inotifywait -r -e modify,create,delete $SOURCE; do
    rsync -vvha --no-p --omit-dir-times --max-size=100m --exclude-from='/path/to/excludedFiles.txt' --delete --delete-excluded $SOURCE $DEST
done
