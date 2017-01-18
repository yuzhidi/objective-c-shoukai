CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

all: prop prop2

prop: Creature.o main.o
	$(CC) -o $@ Creature.o main.o $(FRAME)

prop2: Creature2.o main2.o
	$(CC) -o $@ Creature2.o main2.o $(FRAME)

Creature.o: Creature.h
main.o: Creature.h
Creature2.o: Creature2.h
main2.o: Creature2.h

clean:
	/bin/rm -f *.o a.out prop prop2
