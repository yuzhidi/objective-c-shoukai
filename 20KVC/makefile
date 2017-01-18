CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation
EXECS = kvcsimple relation kvcindex kvosample

all: $(EXECS)

kvcsimple: kvcsimple.o
	$(CC) -o $@ kvcsimple.o $(FRAME)
relation: relation.o
	$(CC) -o $@ relation.o $(FRAME)
kvcindex: kvcindex.o
	$(CC) -o $@ kvcindex.o $(FRAME)
kvosample: kvosample.o
	$(CC) -o $@ kvosample.o $(FRAME)

clean:
	/bin/rm -f *.o a.out $(EXECS)
