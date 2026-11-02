# Etapa 3: reserva de assentos

Impedir que dois passageiros ocupem a mesma vaga.

## Construção da lógica

A chegada publica free_seats e acorda os passageiros. Cada reserva decrementa waiting e free_seats e incrementa boarding, na mesma seção crítica. O vagão espera pela condição boarding_done.

## Limite desta etapa

station_on_board ainda termina com abort(). Um embarque real não termina nesta etapa: falta confirmar os assentos ocupados.

## Arquivos e comandos

`sync_car.h` declara o estado e a API; `sync_car.c` contém a implementação desta etapa; `Makefile` define a compilação. Cada pasta é independente.

```sh
make clean
make
```

A campanha específica de reserva de assentos foi concluída: quatro cenários, 20 execuções cada, em lotes de 10. Todos os 80 testes passaram. Em cada cenário, os dois lotes tiveram a mesma saída e o mesmo hash do binário. Consulte `evidencias.log` nesta pasta para as saídas completas e o resumo final. O teste antigo de inicialização foi retirado desta pasta antes da publicação.

Os cenários cobrem duas pessoas para uma vaga, 16 pessoas em quatro carros, três pessoas em duas ondas e duas estações com distribuições distintas. A confirmação de embarque é simulada pelo teste sob o mutex, pois `station_on_board` ainda não está implementada nesta etapa. Os auxiliares e logs individuais ficam em `work/campanha_etapa3`.

Os arquivos `.c` e `.h` não contêm comentários. As explicações ficam neste README.
