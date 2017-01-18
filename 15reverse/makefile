TARGET = reserve
CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

$(TARGET): ReversibleString.m
	$(CC) $(CFLAGS) -o $(TARGET) ReversibleString.m $(FRAME)

clean:
	/bin/rm -f *.o a.out $(TARGET)
