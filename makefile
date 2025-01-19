CXX = gcc
CFLAGS = -Wall -fopenmp -O3
CLIBREF = -lm

report:
	$(CXX) $(CFLAGS) src/report.c -o build/report

exo2:
	$(CXX) $(CFLAGS) src/exo2.c $(CLIBREF) -o build/exo2

exo3:
	$(CXX) $(CFLAGS) src/exo3.c $(CLIBREF) -o build/exo3

	# $(CXX) $(CFLAGS) src/exo3.c -D ARG_SCHEDULE=static $(CLIBREF) -o build/exo3_static
	# $(CXX) $(CFLAGS) src/exo3.c -D ARG_SCHEDULE=dynamic $(CLIBREF) -o build/exo3_dynamic
	# $(CXX) $(CFLAGS) src/exo3.c -D ARG_SCHEDULE=guided $(CLIBREF) -o build/exo3_guided

exo4:
	$(MAKE) -C src/exo4 debug

clean:
	rm -f build/report build/exo2 build/exo3_static build/exo3 build/exo3_dynamic build/exo3_guided
	rm -f **/*.csv
	rm -f **/*.png
	$(MAKE) -C src/exo4 clean
