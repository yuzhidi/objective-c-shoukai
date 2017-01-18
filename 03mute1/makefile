CC = clang
CFLAGS = -Wall
FRAME = -framework Foundation
OBJ = main.o Volume.o MuteVolume.o

vol: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
Volume.m: Volume.h
MuteVolume.m: Volume.h MuteVolume.h
main.m: Volume.h MuteVolume.h

clean:
	/bin/rm -f *.o vol a.out
