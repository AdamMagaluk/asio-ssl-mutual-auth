CPP=g++
CFLAGS=-I.-DKSSL_DEBUG
DEPS = server.cpp

LDFLAGS=-lcrypto -lssl -lboost_system

%.o: %.cpp $(DEPS)
	$(CPP) -c -o $@ $< $(CFLAGS)

all: client server

server: server.o 
	g++ $(LDFLAGS) -o server server.o $(CFLAGS)

client: client.o
	g++ $(LDFLAGS) -o client client.o $(CFLAGS)


.PHONY: clean

clean:
	rm -f *.o server client
