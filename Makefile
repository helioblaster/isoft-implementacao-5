CC = cc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -Werror -O2
THREAD_FLAGS = -pthread

.PHONY: all clean test
all: sync_car.o

sync_car.o: sync_car.c sync_car.h
	$(CC) $(CFLAGS) $(THREAD_FLAGS) -c sync_car.c -o $@

teste_etapa1: sync_car.c sync_car.h teste_etapa1.c
	$(CC) $(CFLAGS) $(THREAD_FLAGS) sync_car.c teste_etapa1.c -o $@

test: teste_etapa1
	./teste_etapa1

clean:
	rm -f sync_car.o teste_etapa1
