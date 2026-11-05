CC = cc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -O2
CPPFLAGS = -D_DEFAULT_SOURCE
THREAD_FLAGS = -pthread

.PHONY: all clean test test-inicial test-integracao
all: sync_car

sync_car: sync_car.c sync_car.h sync_car-runner.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(THREAD_FLAGS) sync_car.c sync_car-runner.c -o $@

teste_etapa1: sync_car.c sync_car.h teste_etapa1.c
	$(CC) $(CFLAGS) -Werror $(THREAD_FLAGS) sync_car.c teste_etapa1.c -o $@

testes: sync_car.c sync_car.h testes.c
	$(CC) $(CFLAGS) -Werror $(THREAD_FLAGS) sync_car.c testes.c -o $@

test-inicial: teste_etapa1
	./teste_etapa1

test-integracao: testes
	./testes

test: sync_car testes
	./testes
	./sync_car

clean:
	rm -f sync_car testes teste_etapa1 *.o
