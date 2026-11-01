# Etapa 2: espera do passageiro

Registrar quem chegou e bloquear enquanto não há vaga.

## Construção da lógica

station_wait_for_car incrementa waiting sob o mutex e usa while com pthread_cond_wait. O retorno da espera sempre reavalia o estado; uma notificação isolada não comprova que há assento.

## Limite desta etapa

A abertura do vagão e a confirmação ainda terminam com abort(). A reserva de vagas será acrescentada na etapa 3. Esta pasta não é uma solução completa.

## Arquivos e comandos

`sync_car.h` declara o estado e a API; `sync_car.c` contém a implementação desta etapa; `teste_etapa1.c` verifica a inicialização; `Makefile` define a compilação. Cada pasta é independente.

```sh
make clean
make
```

Campanha específica desta etapa concluída em 01/11/2026: quatro cenários, vinte execuções por cenário, totalizando 80/80 aprovações, sem falhas ou timeout. Foram executados lotes de dez, com continuação a cada cinco minutos. O resumo final e todas as saídas estão em `evidencias.log`. Os testes auxiliares ficam fora desta pasta, em `work/campanha_etapa2`. O alvo antigo `make test` verifica apenas a inicialização e não executa esta campanha.

Os arquivos `.c` e `.h` não contêm comentários. As explicações ficam neste README.

Os cenários verificam bloqueio sem disponibilidade, reavaliação após notificações sem vaga, espera coletiva e independência entre estações. A disponibilidade é simulada diretamente sob o mutex, porque o carregamento do vagão ainda não está implementado. Não há reserva de assento nem confirmação nesta etapa.

O log final tem 64780 bytes (64.78 KB). As saídas coincidiram dentro de cada cenário. Os dois lotes de cada cenário usaram fontes e binários com hashes iguais. A campanha foi encerrada; nenhuma etapa posterior foi executada.
