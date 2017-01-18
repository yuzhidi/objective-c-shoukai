CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

all: exsimple assert throwtest

exsimple: exsimple.m
	$(CC) $(CFLAGS) -o $@ exsimple.m $(FRAME)

assert: assert.m
	$(CC) $(CFLAGS) -o $@ assert.m $(FRAME)

throwtest: throwtest.m
	$(CC) $(CFLAGS) -o $@ throwtest.m $(FRAME)

clean:
	/bin/rm -f *.o a.out exsimple assert throwtest
