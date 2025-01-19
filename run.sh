#!/bin/bash

# Define array sizes and thread counts
array_sizes=(1000 100000 10000000 100000000) # 10^3, 10^5, 10^7, 10^8
thread_counts=$(seq 2 1 16)                  # Thread counts from 2 to 16
moyenne=$(seq 1 1 10)                        # Sequence for averaging runs

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <option>"
  echo "Options:"
  echo "  1 - Run report"
  echo "  2 - Run exercise 2"
  echo "  3 - Run exercise 3"
  echo "  4 - Run exercise 4"
  exit 1
fi

option=$1

# Create the test directory if it doesn't exist
mkdir -p test

# Determine the exercise name and CSV file path
case $option in
  1)
    echo "Generating report..."
    exit 0
    ;;
  2)
    exercise="exo2"
    make exo2
    ;;
  3)
    exercise="exo3"
    make exo3
    ;;
  4)
    exercise="exo4"
    make exo4
    ;;
  *)
    echo "Invalid option. Valid options are 1, 2, 3, or 4."
    exit 1
    ;;
esac

csv_file="test/${exercise}.csv"

# Initialize CSV file with headers if not exists
if [ ! -f "$csv_file" ]; then
  echo "Exercise,Array Size,Threads,Execution Time" > "$csv_file"
fi

# Function to run and log the results
run_and_log() {
  local exercise=$1
  local array_size=$2
  local threads=$3
  local output

  output=$(./build/$exercise $array_size $threads)
  execution_time=$(echo "$output" | grep -oP "(?<=Le temps d'execution de log )[\d.]+")

  # Append to CSV
  echo "$exercise,$array_size,$threads,$execution_time" >> "$csv_file"
}

# Execute based on the selected option
if [ "$option" == "2" ]; then
  for taille in "${array_sizes[@]}"; do
    for threads in $thread_counts; do
      echo "Running exercise 2 with array size: $taille and threads: $threads"
      run_and_log "exo2" "$taille" "$threads"
    done
  done
elif [ "$option" == "3" ]; then
  for taille in "${array_sizes[@]}"; do
    for threads in $thread_counts; do
      echo "Running exercise 3 with array size: $taille and threads: $threads"
      run_and_log "exo3" "$taille" "$threads"
    done
    # Static scheduling
    for threads in $thread_counts; do
      echo "Running exercise 3 with array size: $taille and threads: $threads using static scheduling"
      for i in $moyenne; do
        run_and_log "exo3_static" "$taille" "$threads"
      done
    done
    # Dynamic scheduling
    for threads in $thread_counts; do
      echo "Running exercise 3 with array size: $taille and threads: $threads using dynamic scheduling"
      for i in $moyenne; do
        run_and_log "exo3_dynamic" "$taille" "$threads"
      done
    done
    # Guided scheduling
    for threads in $thread_counts; do
      echo "Running exercise 3 with array size: $taille and threads: $threads using guided scheduling"
      for i in $moyenne; do
        run_and_log "exo3_guided" "$taille" "$threads"
      done
    done
  done
elif [ "$option" == "4" ]; then
  for taille in "${array_sizes[@]}"; do
    for threads in $thread_counts; do
      echo "Running exercise 4 with array size: $taille and threads: $threads"
      run_and_log "exo4" "$taille" "$threads"
    done
  done
fi
