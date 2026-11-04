# Etapa 5: casos limite

Definir o comportamento para zero vagas e contagens negativas.

## Construção da lógica

station_load_car retorna imediatamente para count <= 0. Contagem negativa é tratada como zero por decisão defensiva. A saída sempre zera as vagas, evitando reservas depois da partida.

## Limite desta etapa

A API pressupõe uma inicialização, um carro por vez e uma confirmação por reserva. Não há validação de ponteiros nulos, garantia FIFO ou tratamento de falhas de criação dos recursos pthread.

## Arquivos e comandos

`sync_car.h` declara o estado e a API; `sync_car.c` contém a implementação desta etapa; `teste_etapa1.c` verifica a inicialização; `Makefile` define a compilação. Cada pasta é independente.

```sh
make clean
make
```

A campanha específica desta etapa foi concluída: quatro cenários com 20 execuções cada, em lotes de 10 a cada 7 minutos e 15 segundos. Todas as 80 execuções passaram, sem falha ou timeout. Os cenários incluem contagem zero, negativa, vagas sobrando e embarque em duas ondas. Em cada cenário, os dois lotes tiveram a mesma saída e o mesmo hash do binário. O resumo e as saídas estão em `evidencias.log`; os auxiliares ficam em `work/campanha_etapas4_5`. O alvo `make test` verifica somente a inicialização.

Os arquivos `.c` e `.h` não contêm comentários. As explicações ficam neste README.
