TARGET = encode
CC = clang
CFLAGS = -Wall -fobjc-arc

$(TARGET): $(TARGET).m
	$(CC) -o $@ $(TARGET).m -framework Foundation

clean:
	/bin/rm -f *.o $(TARGET) a.out
