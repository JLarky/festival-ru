#!/bin/bash
# http://ru.festivalspeaker.wikia.com

#echo "$1" | text2wave -o - -eval "(voice_msu_ru_nsh_clunits)" | mplayer -
echo "$1" | text2wave -o /tmp/saytext_ru.wav -eval "(voice_msu_ru_nsh_clunits)"
padsp mplayer -ao oss  /tmp/saytext_ru.wav > /dev/null 2>&1