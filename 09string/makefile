CC = clang
#CC = gcc -std=c99
CFLAGS = -Wall

str: str.o
	$(CC) -o $@ str.o -framework Foundation

clean:
	/bin/rm -f *.o str a.out
