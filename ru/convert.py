#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys

if not sys.argv[2:]:
    print "usage "+sys.argv[0]+": input output"
    exit(0)
else:
    f_in, f_out = sys.argv[1:3]

f = open(f_in)
fout = open(f_out, 'w')
line = ''
while 1:
    prevline = line
    line = f.readline()
    line = line.decode("utf-8")

    if (len(line)>1) and (173)==ord(line[-2:-1]):
        print 123
        #line = line.encode("utf-8")
        line = line[:-2]
        #line = line.decode("utf-8")

    char = line[0:1]
    if not char.isupper():
        prevline = prevline.rstrip('\n')+" "
    fout.write(prevline.encode("utf-8"))
    if not line: break

fout.write('\n')

f.close()
fout.close()

print "all done, I guess..."
