#!/bin/bash

# Define array sizes and thread counts
array_sizes=(1000 100000 10000000 100000000) # 10^3, 10^5, 10^7, 10^8
thread_counts=$(seq 2 1 16) # Thread counts from 2 to 16

# Build the program
make exo2

# Loop through each combination of array size and thread count
for taille in "${array_sizes[@]}"; do
    for threads in $thread_counts; do
        echo "Running with array size: $taille and threads: $threads"
        ./build/exo2 $taille $threads
    done
done
