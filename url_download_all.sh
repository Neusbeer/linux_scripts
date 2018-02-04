#!/bin/bash
if [ -z "$1" ]; then
    echo -e "No url given. Needs http(s)://\n"
    exit 1
fi

DOMAIN=`echo $1 | cut -d / -f 3`
URL_PATH=`echo $1 | cut -d / -f 4- | sed 's/\//_/g' | sed 's/.$//'`
PATH_LENGTH=`echo $1 | cut -d / -f 4- | sed 's/.$//' | grep -o '\/' | wc -l`
PATH_LENGTH=$((PATH_LENGTH+1))
echo "$DOMAIN"
echo "$URL_PATH"
mkdir -p "$DOMAIN"/"$URL_PATH"
cd "$DOMAIN/$URL_PATH"
wget --no-check-certificate --recursive --no-parent --force-html --level=10 --cut-dirs=$PATH_LENGTH "$1" --no-host-directories
echo "files saved to : $DOMAIN/$URL_PATH | url path length $PATH_LENGTH"
