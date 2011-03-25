#!/bin/bash
# http://ru.festivalspeaker.wikia.com

#echo "$1" | text2wave -o - -eval "(voice_msu_ru_nsh_clunits)" | mplayer -
[[ -z "$1" || -z "$2" ]] && echo "usage $0: input output" && exit 1
FILE=`mktemp`
(
[[ -f ".$1.sha1" ]] && sha1sum -c ".$1.sha1" --quiet 1>/dev/null 2>&1 && echo "already converted. remove .$1.sha1 to force" && touch "$2" && exit 0
rm -f "$2"
`dirname $0`/fest2read.sh "$1" $FILE
cat $FILE | text2wave -o - -eval "(audio_mode 'async)" -eval "(voice_msu_ru_nsh_clunits)" | lame --abr 16 - "$2"
);
rm -f $FILE

[[ -f "$2" ]] && (echo ok; sha1sum "$1" "$2" > ".$1.sha1") || (echo "Error while speaking file" && exit 1)
