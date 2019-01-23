#/bin/bash
nc -l -p 99 | uncompress -c | tar xvfp -
