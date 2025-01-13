CXX = gcc
CFLAGS = -Wall -fopenmp -O3
CLIBREF = -lm
report:
	$(CXX) $(CFLAGS) src/report.c -o build/report

exo2:
	$(CXX) $(CFLAGS) src/exo2.c $(CLIBREF) -o build/exo2
