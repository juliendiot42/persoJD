#!/bin/bash

# do not forget the "/" at the end of the paths source and destination
while inotifywait -r -e modify,create,delete /path/to/source/; do
    rsync -vvha --no-p --omit-dir-times --max-size=100m --exclude-from='/path/to/excludedFiles.txt' --delete --delete-excluded /path/to/destination/
done
