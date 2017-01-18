CC = clang
CFLAGS = -Wall
FRAME = -framework Foundation

samples: dyna type
dyna: dyna.m
	$(CC) $(CFLAGS) -o $@ dyna.m $(FRAME)
type: type.m
	$(CC) $(CFLAGS) -o $@ type.m $(FRAME)

all: dyna signature overload type
signature: signature.m
	$(CC) $(CFLAGS) -o $@ signature.m $(FRAME)
overload: overload.cpp
	clang++ $(CFLAGS) -o $@ overload.cpp

clean:
	/bin/rm -f *.o a.out dyna type signature overload
