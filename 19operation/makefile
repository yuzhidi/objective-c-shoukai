CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

ALL: opr1 opr2 opr2b opr2c opr3 opr3b

opr1: opr1.m
	$(CC) $(CFLAGS) -o $@ opr1.m $(FRAME)
opr2: opr2.m
	$(CC) $(CFLAGS) -o $@ opr2.m $(FRAME)
opr2b: opr2b.m
	$(CC) $(CFLAGS) -o $@ opr2b.m $(FRAME)
opr2c: opr2c.m
	$(CC) $(CFLAGS) -o $@ opr2c.m $(FRAME)
opr3: opr3.m
	$(CC) $(CFLAGS) -o $@ opr3.m $(FRAME)
opr3b: opr3b.m
	$(CC) $(CFLAGS) -o $@ opr3b.m $(FRAME)

clean:
	/bin/rm -f *.o a.out opr1 opr2 opr2b opr2c opr3 opr3b
