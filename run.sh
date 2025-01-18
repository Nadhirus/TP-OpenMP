#!/bin/bash

# Define array sizes and thread counts
array_sizes=(1000 100000 10000000 100000000) # 10^3, 10^5, 10^7, 10^8
thread_counts=$(seq 2 1 16)                  # Thread counts from 2 to 16
moyenne=$(seq 1 1 10)                        # Build the program
# make exo2

make exo3

# # Loop through each combination of array size and thread count
# for taille in "${array_sizes[@]}"; do
#     for threads in $thread_counts; do
#         echo "Running with array size: $taille and threads: $threads"
#         ./build/exo2 $taille $threads
#     done
# done

# Loop through each combination of array size and thread count
for taille in "${array_sizes[@]}"; do
  for threads in $thread_counts; do
    echo "Running with array size: $taille and threads: $threads"
    ./build/exo3 $taille $threads
  done
done

# # Loop through each combination of array size and thread count
# for taille in "${array_sizes[@]}"; do
#   for threads in $thread_counts; do
#     echo "Running with array size: $taille and threads: $threads using static scheduling"
#     for i in $moyenne; do
#       ./build/exo3 $taille $threads
#     done
#   done
# done

# # Loop through each combination of array size and thread count
# for taille in "${array_sizes[@]}"; do
#   for threads in $thread_counts; do
#     echo "Running with array size: $taille and threads: $threads using static scheduling"
#     for i in $moyenne; do
#       ./build/exo3_static $taille $threads
#     done
#   done
# done

# for taille in "${array_sizes[@]}"; do
#   for threads in $thread_counts; do
#     echo "Running with array size: $taille and threads: $threads using dynamic scheduling"
#     for i in $moyenne; do
#       ./build/exo3_dynamic $taille $threads
#     done
#   done
# done

# for taille in "${array_sizes[@]}"; do
#   for threads in $thread_counts; do
#     echo "Running with array size: $taille and threads: $threads using guided scheduling"
#     for i in $moyenne; do
#       ./build/exo3_guided $taille $threads
#     done
#   done
# done
