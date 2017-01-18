CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation
OBJ = BitPattern.o main.o

bit: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
BitPattern.o: BitPattern.h
main.o: BitPattern.h

clean:
	/bin/rm -f *.o a.out bit
