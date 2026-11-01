# Etapa 1: inicialização da estação

Login: hmrn.

Esta etapa define a estrutura da estação e implementa `station_init`: um mutex, duas variáveis de condição e três contadores. As funções de espera, carregamento do vagão e confirmação de embarque ainda chamam `abort()`. Esta pasta é uma etapa parcial do desenvolvimento.

## Arquivos

| Arquivo | Responsabilidade |
| --- | --- |
| `sync_car.c` | Inicialização e funções ainda não implementadas. |
| `sync_car.h` | Estrutura compartilhada e protótipos. |
| `Makefile` | Compilação do módulo e limpeza. |
| `README.md` | Escopo, compilação e resultados. |
| `hmrn.pdf` | Relatório conforme as seções do guia. |
| `evidencias.log` | Teste inicial e 80 execuções da campanha em um único registro. |

## Compilação

Ambiente utilizado: Ubuntu no WSL2, Linux 6.18.54.1-microsoft-standard-WSL2, GCC 15.2.0 e GNU Make 4.4.1. É necessário um compilador C com pthreads.

Dentro desta pasta, em um terminal Linux:

```sh
make clean
make
```

O resultado é `sync_car.o`. Esta etapa não tem `main` nem gera um programa executável. Use `make clean` para remover o objeto antes do commit.

## Testes realizados

O teste inicial passou em quatro verificações. A campanha posterior teve quatro cenários com 20 execuções cada: **80/80 aprovações**, sem avisos de compilação, falhas ou timeout.

| Cenário | Verificação | Resultado |
| --- | --- | --- |
| 1 | 64 estações e 192 contadores zerados. | 20/20 PASS |
| 2 | Oito threads somando 400.000 incrementos sob o mutex. | 20/20 PASS |
| 3 | 1.000 trocas de sinais com confirmação. | 20/20 PASS |
| 4 | Broadcast independente em duas estações com 16 threads cada. | 20/20 PASS |

O log preserva comandos, saídas, horários e hashes. Os testes e scripts auxiliares foram retirados desta pasta a pedido do usuário. Os comandos históricos dependem desses arquivos e não podem ser reproduzidos apenas com este conjunto reduzido. O Makefile atual contém somente compilação e limpeza; seu hash difere do registrado na campanha. Os fontes `sync_car.c` e `sync_car.h` foram preservados.

Esses resultados verificam a inicialização e os recursos de sincronização. O protocolo de embarque ainda não foi validado nesta etapa.

## Exigências dos guias

O enunciado exige README e relatório PDF dentro do repositório GitHub. Para a entrega final, exige código, README e Makefile no pacote `hmrn.tar`, com o diretório `hmrn/`; o guia também exige `evidencias.log` no TAR e o envio de `hmrn.pdf`. Os testes auxiliares não são listados como arquivos obrigatórios de publicação.

O executável `sync_car`, o protocolo completo e sua validação pertencem à entrega final. Esta etapa parcial não substitui essa entrega. O PDF descreve as pendências, inclusive as capturas de tela ainda não produzidas.
