#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#include <math.h>
#include <stdatomic.h>

#define ARG_SCHEDULE static

double start = 0;
double finish = 0;
float *tableau;
double resultat = 0;

void fonction_sequentielle_sum(float *tableau, double *resultat, int tailleTableau);

int main(int argc, char *argv[])
{
  if (argc != 3)
  {
    printf("Usage: %s <tailleTableau> <nombreThreads>\n", argv[0]);
    return 1;
  }

  int tailleTableau = atoi(argv[1]);
  int nombreThreads = atoi(argv[2]);

  // initialisation de tableau
  tableau = (float *)malloc(sizeof(float) * tailleTableau);
  for (int i = 0; i < tailleTableau; i++)
  {
    tableau[i] = (float)rand();
  }

  start = omp_get_wtime();

  // Parallel section using reduction for resultat
#pragma omp parallel num_threads(nombreThreads) reduction(+:resultat)
  {
    fonction_sequentielle_sum(tableau, &resultat, tailleTableau);
  }
  finish = omp_get_wtime();
  printf("Le temps d'execution de sum %f \n", (finish - start));

  return 0;
}

void fonction_sequentielle_sum(float *tableau, double *resultat, int tailleTableau)
{
  // #pragma omp for schedule (ARG_SCHEDULE)
  for (int i = 0; i < tailleTableau; i++)
  {
// #pragma omp atomic
    *resultat += tableau[i];
  }
}
