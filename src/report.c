#include <stdio.h>
#include <omp.h>

int main() {
    int num_procs = omp_get_num_procs();
    printf("Nombre de processeurs disponibles : %d\n", num_procs);

    int max_threads = omp_get_max_threads();
    printf("Nombre maximum de threads : %d\n", max_threads);

    return 0;
}
