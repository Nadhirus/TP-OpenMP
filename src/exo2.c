#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#include <math.h>

double start = 0;
double finish = 0;
float *tableau;
float *resultat;

void fonction_sequentielle_mult(float *tableau, float *resultat, int tailleTableau);
void fonction_sequentielle_log(float *tableau, float *resultat, int tailleTableau);

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

  // initialisation de tableau de resultats
  resultat = (float *)malloc(sizeof(float) * tailleTableau);

  //   start = omp_get_wtime();
  // #pragma omp parallel num_threads(nombreThreads)
  //   {
  //     fonction_sequentielle_mult(tableau, resultat, tailleTableau);
  //   }
  //   finish = omp_get_wtime();
  //   // printf("Le temps d'execution %f \n", (finish - start));

  start = omp_get_wtime();
#pragma omp parallel num_threads(nombreThreads)
  {
    fonction_sequentielle_log(tableau, resultat, tailleTableau);
  }
  finish = omp_get_wtime();
  printf("Le temps d'execution de log %f \n", (finish - start));

  return 0;
}

void fonction_sequentielle_mult(float *tableau, float *resultat, int tailleTableau)
{
  for (int i = 0; i < tailleTableau; i++)
  {
    resultat[i] = 2.17 * tableau[i];
  }
}

void fonction_sequentielle_log(float *tableau, float *resultat, int tailleTableau)
{
  for (int i = 0; i < tailleTableau; i++)
  {
    resultat[i] = 2.17 * log(tableau[i]) * cos(tableau[i]);
  }
}
