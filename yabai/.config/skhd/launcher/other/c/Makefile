CC := cc
FLAGS := -O3 -Wall

SRCS := $(wildcard *.c)
OBJS := ${SRCS:c=o} 

all : menu

menu: $(OBJS)
	$(CC) $(OBJS) -o menu

clean:
	rm -f menu *.o

%.o: %.c
	$(CC) $(FLAGS) -c $<
