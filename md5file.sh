#!/bin/bash
echo $1 | rev | cut -d / -f 1 | rev | cut -d ? -f 1
curl -N -k -s "$1" | md5sum -b | grep -o '[0-9a-z]*'
