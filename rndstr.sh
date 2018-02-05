#!/bin/bash
#
# Output random line from text file
# e.g rndstr user-agents.txt
#
if [ -z "$1" ]; then
    echo -e "No file given.\n"
    exit 1
fi
if [ ! -r "$1" ]; then
    echo -e "File not readable.\n"
    exit 1
fi
LEN=`wc -l < $1`
RND=$[ ( $RANDOM % $LEN ) + 1 ]
LINE=`sed -n "${RND}p" $1`
echo $LINE
