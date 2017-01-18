TARGET = makeplist
CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

all: $(TARGET)

$(TARGET): $(TARGET).o
	$(CC) -o $@ $(TARGET).o $(FRAME)

clean:
	/bin/rm -f a.out *.o makeplist output*.plist
