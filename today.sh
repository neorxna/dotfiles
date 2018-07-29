#!/bin/bash
touch $PWD/times

DATE="$(date '+%A %Y-%m-%d')"
LAST="$(cat times | tail -1)"

# if the last entry was a closer, write the opener then append
if [[ $LAST == "---" ]] || [[ $LAST == "" ]]; then
    echo "* $DATE" >> times
fi

# -c argument appends the line then closes
if [[ "$1" == "-c" ]]; then
    echo "${@:2}" >> times
    echo "---" >> times
# otherwise just append line
else
    echo "$@" >> times
fi

cat times
