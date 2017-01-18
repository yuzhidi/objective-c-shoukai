CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation
OBJ = NSString+PathComp.o main.o

all: compo
compo: $(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAME)
NSString+PathComp.o: NSString+PathComp.h
main.o: NSString+PathComp.h

clean:
	/bin/rm -f *.o a.out compo
