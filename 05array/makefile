TARGETA = array
TARGETB = mem
CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

all: $(TARGETA) $(TARGETB)

$(TARGETA): $(TARGETA).m People.o
	$(CC) $(CFLAGS) -o $(TARGETA) $(TARGETA).m People.o $(FRAME)

$(TARGETB): $(TARGETB).m People.o
	$(CC) $(CFLAGS) -o $(TARGETB) $(TARGETB).m People.o $(FRAME)

People.o: People.h
clean:
	/bin/rm -f *.o a.out $(TARGETA) $(TARGETB)
