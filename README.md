# Etapa 6: experimento de bloqueio

Esta pasta contém temporariamente uma variante com defeito intencional para estudo. Em `sync_car.c`, a chegada do carro usa `pthread_cond_signal` para a condição dos passageiros. A versão anterior está preservada em `work/estudo_etapa6/sync_car_original_antes_experimento.c`. Não use esta variante como implementação final.

Especificar verificações do protocolo e compará-las com variantes de estudo.

## Construção da lógica

testes.c controla as confirmações para exigir que várias reservas ocorram antes de qualquer confirmação. Também cobre sobra e falta de vagas, dois vagões, estações independentes e contagem negativa.

## Limite desta etapa

A suíte foi compilada e executada a partir de `work/estudo_etapa6`: os quatro casos passaram com a implementação original antes da troca. A campanha do defeito intencional terminou com 80/80 observações esperadas: 20/20 sem bloqueio no controle e 20/20 bloqueios reproduzidos em cada um dos três cenários com várias vagas. A referência original não apresentou bloqueio nos oito lotes. `evidencias.log` contém somente os comandos, as saídas e os horários originais das 80 execuções no formato do log bruto fornecido como exemplo. Uma sessão posterior capturada integralmente com `script` foi preservada em `work/campanha_etapa6/evidencias_sessao_nova_80.log`, fora da linha do tempo original. O amostrador da fila dorme 1 ms entre leituras apenas no teste; a implementação da estação usa condições, sem polling.

## Arquivos e comandos

`sync_car.h` declara o estado e a API; `sync_car.c` contém a implementação desta etapa; `teste_etapa1.c` verifica a inicialização; `Makefile` define a compilação. Cada pasta é independente.

```sh
make clean
make
```

`make test` verifica somente a inicialização. O alvo `make test-integracao` usa a variante com defeito e pode terminar por timeout. Para reproduzir os resultados controlados, use o executor em `work/campanha_etapa6`. As demais variantes e testes específicos de estudo estão em `work/estudo_etapa6`.

Os arquivos `.c` e `.h` não contêm comentários. As explicações ficam neste README.
