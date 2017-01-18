CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation
OBJ = Philosopher.o main.o

phils: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
Philosopher.o: Philosopher.h
main.o: Philosopher.h

clean:
	/bin/rm -f *.o a.out phils
