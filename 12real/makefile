CC = clang
CFLAGS = -Wall -fobjc-arc -Os
FRAMES = -framework Foundation

OBJ = Fraction.o NSStringReal.o RealArray.o main.o

real:	$(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAMES)

Fraction.o: Fraction.h RealNumber.h
NSStringReal.o: NSStringReal.h RealNumber.h
RealArray.o: RealArray.h RealNumber.h
main.o: Fraction.h NSStringReal.h RealArray.h RealNumber.h

clean:
	/bin/rm -f *.o a.out real
