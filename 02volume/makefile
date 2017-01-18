CC = clang
CFLAGS = -Wall
FRAME = -framework Foundation
OBJ = main.o Volume.o

vol: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
Volume.m: Volume.h
main.m: Volume.h

all: vol voltest

voltest: voltest.m
	$(CC) -o $@ voltest.m $(FRAME)

clean:
	/bin/rm -f *.o vol voltest a.out
