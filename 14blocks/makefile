CC = clang
CFLAGS = -Wall
FRAME = -framework Foundation
CPRO = block1 block2 block3 block5 block5cp block6 block7 sort_f sort_b
OBJCPRO = block6arc retain b_array

all: $(CPRO) $(OBJCPRO)

block6arc: block6arc.m
	$(CC) -Wall -fobjc-arc -o $@ block6arc.m $(FRAME)
retain: retain.m
	$(CC) -Wall -o $@ retain.m $(FRAME)
b_array: b_array.m
	$(CC) -Wall -o $@ b_array.m $(FRAME)

clean:
	/bin/rm -f $(CPRO) $(OBJCPRO) *.o a.out
