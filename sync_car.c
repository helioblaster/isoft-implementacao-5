#include "sync_car.h"
#include <stdlib.h>


void station_init(struct station *station)
{
    pthread_mutex_init(&station->lock, NULL);
    pthread_cond_init(&station->car_available, NULL);
    pthread_cond_init(&station->boarding_done, NULL);
    station->waiting = 0;
    station->free_seats = 0;
    station->boarding = 0;
}

void station_load_car(struct station *station, int count)
{
    (void)station;
    (void)count;
    abort();
}

void station_wait_for_car(struct station *station)
{
    (void)station;
    abort();
}

void station_on_board(struct station *station)
{
    (void)station;
    abort();
}
