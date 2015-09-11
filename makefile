# make file for my  project

main.o: main.c
	gcc -c main.c

m_print.o : m_print.c
	gcc -c -fPIC m_print.c

glob_print.o: glob_print.c
	gcc -c -fPIC glob_print.c

libmprint.so : m_print.o glob_print.o
	gcc -shared -o libmprint.so m_print.o glob_print.o 

build: main.o libmprint.so
	gcc -o binary main.o -L. -lmprint  -Wl,-rpath,.


clean:
	rm -f *.o *.so binary

.PHONY: clean
