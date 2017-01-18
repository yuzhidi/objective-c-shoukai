CC = clang
all: size32 size64

size32: main.c
	$(CC) -m32 -Wall -o $@ main.c
size64: main.c
	$(CC) -m64 -Wall -o $@ main.c

clean:
	/bin/rm -f size?? *.o a.out
