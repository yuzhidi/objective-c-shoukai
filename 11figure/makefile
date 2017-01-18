CC = clang
CFLAGS = -Wall -fobjc-arc
FRAMES = -framework Foundation

OBJ = Figure.o Circle.o Rectangle.o main.o

figure:	$(OBJ)
	$(CC) -o $@ $(OBJ) $(FRAMES)

Figure.o: Figure.h
Circle.o: Circle.h Figure.h
Rectangle.o: Rectangle.h Figure.h
main.o: Figure.h

clean:
	/bin/rm -f *.o a.out figure
