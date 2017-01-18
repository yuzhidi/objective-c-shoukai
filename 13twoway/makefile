CC = clang
CFLAGS = -Wall -fobjc-arc -DDEBUG
# -DNS_BLOCK_ASSERTIONS
FRAME = -framework Foundation
OBJ = TwoWayList.o main.o

twoway: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
TwoWayList.o: TwoWayList.h
main.o: TwoWayList.h

clean:
	/bin/rm -f *.o a.out save.dat twoway
