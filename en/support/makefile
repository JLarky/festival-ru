FILES := $(wildcard file_???)
MP3S := $(FILES:%=%.mp3)
DONES := $(FILES:%=.done.%)

all: file_aaa
	$(MAKE) done

file_aaa: src.txt
	$(RM) file_???
	split -a 3 -l 10 src.txt file_

done: $(MP3S) .done

.done: $(DONES)
	touch .done

clean:
	$(RM) .done* $(FILES) $(MP3S)

%.mp3: %
	rm -f .done .done.$< && echo
	~/scripts/festival/convfile_en.sh $< $@ || echo

.done.%: %
	test -f $<.mp3 && touch $@ && eyeD3 -a "Festival" -G Speech --set-encoding=utf8 -t "`basename $$PWD`" $(<).mp3

