CC = clang
CFLAGS = -Wall -fobjc-arc
FRAME = -framework Foundation

cluster: cluster.m
	$(CC) $(CFLAGS) -o $@ cluster.m $(FRAME)
cluster2: cluster2.m
	$(CC) $(CFLAGS) -o $@ cluster2.m $(FRAME)
cluster3: cluster3.m
	$(CC) $(CFLAGS) -o $@ cluster3.m $(FRAME)
all: cluster cluster2 cluster3

clean:
	/bin/rm -f *.o a.out cluster cluster2 cluster3
