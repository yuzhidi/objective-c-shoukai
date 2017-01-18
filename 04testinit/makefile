TARGET = testinit
CC = clang
CFLAGS = -Wall
FRAME = -framework Foundation

$(TARGET): $(TARGET).m
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).m $(FRAME)

clean:
	/bin/rm -f *.o a.out $(TARGET)
