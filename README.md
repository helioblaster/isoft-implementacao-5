# Sincronização do metrô

Login: hmrn

Implementação em C com pthreads, testada no Ubuntu/WSL2. O teste inicial, os quatro cenários de integração e o runner terminaram com código 0 em 4 de novembro de 2026.

## Arquivos

| Arquivo | Conteúdo |
| --- | --- |
| `sync_car.c` | Implementação das quatro funções da estação. |
| `sync_car.h` | Estado da estação e protótipos. |
| `sync_car-runner.c` | Runner fornecido no enunciado. |
| `teste_etapa1.c` | Teste de inicialização. |
| `testes.c` | Casos de integração e limites. |
| `Makefile` | Compilação, testes e limpeza. |
| `evidencias.log` | Comandos, horários e saídas reais. |
| `hmrn.pdf` | Relatório técnico. |
| `erro_etapa6.png` e `validacao_final.png` | Recortes do log usados no relatório. |

## Compilar e testar

```sh
make clean
make test-inicial
make test-integracao
make
./sync_car
make clean
```

`make` gera `sync_car`. `make clean` remove os binários. A compilação do runner mostra um aviso de parâmetro não utilizado no arquivo recebido; os testes da implementação usam `-Werror` e passaram sem avisos.

## Implementação

Cada estação possui um mutex, duas variáveis de condição e três contadores. `waiting` conta passageiros na fila, `free_seats` conta vagas ainda não reservadas e `boarding` conta reservas sem confirmação. O passageiro reserva a vaga sob o mutex. O vagão parte quando não há mais reservas possíveis e todas as reservas foram confirmadas.

Não há semáforos nem espera ativa em `sync_car.c`. A solução assume uma estação inicializada, um vagão por vez e uma chamada de `station_on_board` para cada retorno de `station_wait_for_car`.

## Entrega

O projeto foi preparado no diretório `hmrn/`, com `hmrn.tar` e `hmrn.pdf`. O link do repositório GitHub ainda depende da criação ou indicação do repositório remoto.
