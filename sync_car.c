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
    pthread_mutex_lock(&station->lock);
    station->waiting++;
    while (station->free_seats == 0)
        pthread_cond_wait(&station->car_available, &station->lock);
    station->waiting--;
    pthread_mutex_unlock(&station->lock);
}

void station_on_board(struct station *station)
{
    (void)station;
    abort();
}
