CC = clang
CFLAGS = -Wall -std=c99 -O2
DEFTIMES = -DLOOP=8000
FRAME = -framework Foundation

all: prog1 prog2 prog3 prog4 prog5
prog1: prog1.m
	$(CC) $(CFLAGS) $(DEFTIMES) -o prog1 prog1.m $(FRAME)
prog2: prog2.m
	$(CC) $(CFLAGS) $(DEFTIMES) -o prog2 prog2.m $(FRAME)
prog3: prog3.m
	$(CC) $(CFLAGS) $(DEFTIMES) -o prog3 prog3.m $(FRAME)
prog4: prog4.m
	$(CC) $(CFLAGS) $(DEFTIMES) -o prog4 prog4.m $(FRAME)
prog5: prog5.m
	$(CC) $(CFLAGS) $(DEFTIMES) -o prog5 prog5.m $(FRAME)

meta: metaclass.m
	$(CC) $(CFLAGS) -o meta metaclass.m $(FRAME)

clean:
	/bin/rm -f *.o a.out prog? meta
