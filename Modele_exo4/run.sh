#!/bin/bash

# Define window sizes, max features, and image list
windows_sizes=(2 4 8 12 16 20) # Window sizes
max_features=(512 1024 2048 4096) # Max features
images=(img_1.jpg img_2. img_3.jpg img_4.jpg img_5.jpg) # Input images
thread_counts=$(seq 2 1 16) 

# Compile the ShiTomasi program
make ShiTomasi

# Loop through each combination of image, window size, and max features
for im in "${images[@]}"; do
   for win_size in "${windows_sizes[@]}"; do
     for feat in "${max_features[@]}"; do
        for threads in $thread_counts; do
            echo "Running with image: $im, window size: $win_size, and max features: $feat, number of thread : $threads"
            ./ShiTomasi ./input_images/$im $win_size $feat $threads
        done
     done
  done
done
