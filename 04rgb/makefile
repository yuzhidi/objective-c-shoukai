CC = clang
CFLAGS = -Wall
FRAME = -framework Foundation
OBJ = main.o RGB.o

rgb: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
RGB.m: RGB.h
main.m: RGB.h

clean:
	/bin/rm -f *.o rgb a.out
