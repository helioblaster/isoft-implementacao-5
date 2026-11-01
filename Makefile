CC = cc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -Werror -O2
THREAD_FLAGS = -pthread

.PHONY: all clean
all: sync_car.o

sync_car.o: sync_car.c sync_car.h
	$(CC) $(CFLAGS) $(THREAD_FLAGS) -c sync_car.c -o $@

clean:
	rm -f sync_car.o
