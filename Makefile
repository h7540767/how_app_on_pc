PROGS = casefactory ac
CC = g++
CFLAGS = -g -O2 -Wall -std=c++11
STD = -std=c++11

all: ${PROGS}
#	rm -f *.csv

casefactory: case.o wrap.o
	${CC} -o casefactory case.o wrap.o
	
ac: main.o wrap.o ac.o
	${CC} -o ac ac.o wrap.o main.o
	
main.o: main.cpp wrap.h ac.h
	${CC} -o main.o -c main.cpp ${STD}
	
ac.o: ac.cpp wrap.h ac.h
	${CC} -o ac.o -c ac.cpp ${STD}
	
case.o: case.cpp wrap.h
	${CC} -o case.o -c case.cpp ${STD}
	
wrap.o: wrap.cpp wrap.h
	${CC} -o wrap.o -c wrap.cpp ${STD}

clean:
	rm -f ${PROGS} *.o

.PHONY: clean