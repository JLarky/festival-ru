FILES=$(wildcard *.txt)
FILE_NAMES=$(FILES:%.txt=%/src.txt)
DONE_FILES=$(FILES:%.txt=%/.done)
MAKE_FILES=$(FILES:%.txt=%/Makefile)

all: $(FILE_NAMES) $(MAKE_FILES) $(DONE_FILES)

%/src.txt: %.txt
	mkdir -p `dirname $@`
	# for ru we will use fest2read and cp for en
	bash -c 'PWD=`pwd`; BN=`basename $$PWD`; [[ $$BN  == "ru" ]]' && ~/festival/scripts/fest2read.sh $< $@ || cp $< $@
	rm -f `dirname $@`/.done

%/.done: %/src.txt
	(cd `dirname $@`; nice -n 20 $(MAKE))

%/Makefile: makefile.inc
	cp $< $@

sync:
	rsync -r ~/festival/ 172.16.0.2:/home/jlarky/sync/festival --progress
