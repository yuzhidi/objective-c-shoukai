TARGET = bridge
CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

$(TARGET): $(TARGET).m
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).m $(FRAME)

clean:
	/bin/rm -f *.o a.out $(TARGET)
