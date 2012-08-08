CPP=g++
CFLAGS=-I.
DEPS = server.cpp

LDFLAGS=-lcrypto -lssl -lboost_system

%.o: %.c $(DEPS)
	$(CPP) -c -o $@ $< $(CFLAGS)

all: client server

server: server.o 
	g++ $(LDFLAGS) -o server server.o -I.

client: client.o
	g++ $(LDFLAGS) -o client client.o -I.


.PHONY: clean

clean:
	rm -f *.o server client
