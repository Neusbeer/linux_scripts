#/bin/bash
curl -s 'https://api.ipify.org?format=json' | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
