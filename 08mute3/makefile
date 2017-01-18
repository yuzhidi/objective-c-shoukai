MM = -m32
CC = clang
CFLAGS = -Wall $(MM)
FRAME = -framework Foundation
OBJ = main.o MuteVolume.o

all: vol32a vol32b vol64

vol32a: $(OBJ)
	$(CC) $(CFLAGS) -c -o Volume.o Volume.m
	$(CC) $(MM) -o $@ $(OBJ) Volume.o $(FRAME)
vol32b: $(OBJ)
	$(CC) $(CFLAGS) -DFRAGILE -c -o Volume.o Volume.m
	$(CC) $(MM) -o $@ $(OBJ) Volume.o $(FRAME)

vol64:
	make -f make64 clean
	make -f make64

MuteVolume.m: MuteVolume.h
main.m: MuteVolume.h

clean:
	/bin/rm -f *.o vol32? vol64? a.out
