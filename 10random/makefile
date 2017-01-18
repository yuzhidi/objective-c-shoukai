CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation
OBJ = main.o NSArray+Random.o

anyone: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)

NSArray+Random.m: NSArray+Random.h
main.m: NSArray+Random.h

clean:
	/bin/rm -f *.o anyone a.out
