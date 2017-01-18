CC = clang
# CC = cc
GCFLAG = -fobjc-gc-only
CFLAGS = -Wall -O0 $(GCFLAG)
FRAME = -framework Foundation

all: gctest test1 test2
gctest: gctest.m
	$(CC) $(CFLAGS) -o $@ gctest.m $(FRAME)
test1: test1.o Chunk.o
	$(CC) -o $@ test1.o Chunk.o $(FRAME)
test2: test2.o Chunk.o
	$(CC) -o $@ test2.o Chunk.o $(FRAME)

clean:
	/bin/rm -f *.o a.out gctest test1 test2
