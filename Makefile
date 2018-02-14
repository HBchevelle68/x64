OBJS = ch2
DBUG = ch2
CC = nasm
CCFLAGS = -felf64
LNK = ld -o

all: clean $(OBJS)

ch2: ch2.o
	$(LNK) $@ $^

%.o: %.asm
	$(CC) $(CCFLAGS) $< -o $@

clean:
	rm -fr *.o


#
#debug-server: server.asm
#	nasm -f  elf -g server.asm
#	ld -melf_i386 -g server.o -o debug-server
#
#debug-client: client.asm
#	nasm -f elf -g client.asm
#	ld -melf_i386 -g client.o -o debug-client
