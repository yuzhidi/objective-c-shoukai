CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

all: prop

prop: Creature.o main.o
	$(CC) -o $@ Creature.o main.o $(FRAME)

Creature.o: Creature.h
main.o: Creature.h

clean:
	/bin/rm -f *.o a.out prop
