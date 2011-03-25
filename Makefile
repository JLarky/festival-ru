all: ru/Makefile en/Makefile run

run:
	(cd ru; make;)
	(cd en; make;)

%/Makefile: makefiles/makefile makefiles/makefile_ru makefiles/makefile_en
	cp $< $@
	cp makefiles/makefile_`dirname $@` `dirname $@`/makefile.inc