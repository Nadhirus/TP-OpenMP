CXX = gcc
CFLAGS = -Wall -fopenmp -O3
report:
	$(CXX) $(CFLAGS) src/report.c -o build/report
