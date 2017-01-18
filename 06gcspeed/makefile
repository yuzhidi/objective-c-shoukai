CC = clang
GCFLAG = -fobjc-gc-only
ARCFLAG = -fobjc-arc
## CFLAGS = -Wall -Os
## CFLAGS = -Wall -O0
FRAME = -framework Foundation

all: speed-mrc speed-arc speed-gc cspeed JSpeed.class
speed-mrc: speed-mrc.m speed.h
	$(CC) $(CFLAGS) -o $@ speed-mrc.m $(FRAME)
speed-arc: speed-arc.m speed.h
	$(CC) $(CFLAGS) $(ARCFLAG) -o $@ speed-arc.m $(FRAME)
speed-gc: speed-gc.m speed.h
	$(CC) $(CFLAGS) $(GCFLAG) -o $@ speed-gc.m $(FRAME)
cspeed: cspeed.c speed.h
	$(CC) $(CFLAGS) -o $@ cspeed.c
JSpeed.class: JSpeed.java
	javac JSpeed.java

cleanCs:
	/bin/rm -f *.o a.out speed-gc speed-arc speed-mrc cspeed
clean:
	/bin/rm -f *.o a.out speed-gc speed-arc speed-mrc cspeed JSpeed.class
