#!/bin/bash
PN=`basename "$0"`			# Program name
VER='1.3'

# Search PATH for a new AWK (or GNU AWK)
for path in `echo "$PATH" | sed 's/^:/.:/;s/:$/:./;s/:/ /g'`
do
    [ -x "$path/gawk" ] && : ${NAWK=$path/gawk}
    [ -x "$path/nawk" ] && : ${NAWK=$path/nawk}
done
: ${NAWK=awk}

Usage () {
    echo >&2 "$PN - show syntax of a command, $VER (stv '94)
usage: $PN command [command ...]"
    exit 1
}

[ $# -lt 1 -o "$1" = "-h" ] && Usage

man "$@" 2>/dev/null |
    col -b |
    $NAWK '($1 ~ /^[sS][yY][nN][oO][pP][sS][iI][sS]/) {
	while ( getline )
	{
	    # assume the next section starts with at least two
	    # characters in upper case in column 1
	    if ( $0 ~ /^[A-Z][A-Z][A-Z]*$/ ) exit 0	# next section
	    print
	}
    }
    '
