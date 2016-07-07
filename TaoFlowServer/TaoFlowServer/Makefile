cCC = g++

ELF = server
ROOTSRC = $(wildcard *.cpp)
ROOTOBJ = $(ROOTSRC:%.cpp = %.o)



$ELF:$(ROOTOBJ)
	$(cCC) -g  -o $(ELF) $(ROOTOBJ) -lpthread
clean:
	rm -rf *.o main	
