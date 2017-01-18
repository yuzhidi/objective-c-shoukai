CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation
OBJ = Fraction.o FracRegister.o main.o

all: fraction
fraction: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
Fraction.o: Fraction.h
FracRegister.o: Fraction.h FracRegister.h
main.o: Fraction.h FracRegister.h

clean:
	/bin/rm -f *.o a.out fraction
