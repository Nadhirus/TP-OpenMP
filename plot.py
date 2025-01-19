import pandas as pd
import matplotlib.pyplot as plt
import sys
import os

# Check if the exercise number is passed as argument
if len(sys.argv) != 2:
    print("Usage: python plot_execution_time.py <exercise_number>")
    sys.exit(1)

# Get the exercise number
exercise_number = sys.argv[1]

# Construct the CSV file path based on the exercise number
csv_file = f"test/exo{exercise_number}.csv"

# Check if the CSV file exists
if not os.path.exists(csv_file):
    print(f"Error: {csv_file} not found.")
    sys.exit(1)

# Read the CSV into a pandas DataFrame
df = pd.read_csv(csv_file)

# Create the results directory if it doesn't exist
os.makedirs("results", exist_ok=True)

# Get the exercise name (e.g., exo2, exo3, etc.)
exercise_name = df['Exercise'].iloc[0]

# Initialize a plot
plt.figure(figsize=(10, 6))

# Get unique array sizes
array_sizes = df['Array Size'].unique()

# Plot execution time for each array size
for array_size in array_sizes:
    subset = df[df['Array Size'] == array_size]
    plt.plot(subset['Threads'], subset['Execution Time'], label=f"Array Size: {array_size}")

# Customize the plot
plt.title(f"Execution Time vs Number of Threads ({exercise_name})")
plt.xlabel("Number of Threads")
plt.ylabel("Execution Time (seconds)")
plt.legend(title="Array Size")
plt.grid(True)

# Save the plot to the results directory with the same name as the exercise number
output_file = f"results/exo{exercise_number}.png"
plt.savefig(output_file)

# Show the plot
plt.show()

print(f"Plot saved as {output_file}")
