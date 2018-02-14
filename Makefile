OBJS = ch2 ch2_1
DBUG = ch2_debug ch2_1_debug
CC = nasm
CCFLAGS = -felf64
DBFLAGS = $(CCFLAGS) -g
LNK = ld -o
 

all: clean $(OBJS)

debug: ch2_debug ch2_1_debug


ch2: ch2.o
	$(LNK) $@ $^

ch2_debug: ch2_debug.o
	$(LNK) $@ -g $^

ch2_1: ch2_1.o
	$(LNK) $@ $^

ch2_1_debug: ch2_1_debug.o
	$(LNK) $@ -g $^


%_debug.o: %.asm
	$(CC) $(DBFLAGS) $< -o $@

%.o: %.asm
	$(CC) $(CCFLAGS) $< -o $@

clean::
	rm -fr *.o

