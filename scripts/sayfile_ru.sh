#!/bin/bash

[[ -z $1 ]] && echo "usage $0: filename" && exit 1
TMPFILE=/tmp/saytext_ru.mp3
FILE=`mktemp`
(
`dirname $0`/fest2read.sh $1 $FILE
`dirname $0`/convfile_ru.sh $FILE $TMPFILE
padsp mplayer -ao oss $TMPFILE > /dev/null 2>&1
);
rm -f $FILE