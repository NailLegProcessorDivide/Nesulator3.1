CC=clang
OPTIMIZE=-O3
EXTRAFLAGS=
CFLAGS=$(OPTIMIZE) $(EXTRAFLAGS) -Wextra -I/usr/include/SDL2 -funsafe-math-optimizations -mavx2
LDFLAGS=-lSDL2

nesulator: cpu.o apu.o gameCart.o main.o memory.o ppu.o window.o
	$(CC) -o nesulator cpu.o apu.o gameCart.o main.o memory.o ppu.o window.o $(LDFLAGS) 

cpu.o: cpu.c cpu.h data.h emulatorGlue.h
	$(CC) -c -o cpu.o cpu.c $(CFLAGS)

apu.o: apu.c apu.h data.h emulatorGlue.h
	$(CC) -c $(CFLAGS) -o apu.o apu.c $(CFLAGS)

gameCart.o: gameCart.c gameCart.h ppu.h emulatorGlue.h
	$(CC) -c $(CFLAGS) -o gameCart.o gameCart.c $(CFLAGS)

main.o: main.c cpu.h ppu.h apu.h memory.h gameCart.h data.h
	$(CC) -c $(CFLAGS) -o main.o main.c $(CFLAGS)

memory.o: memory.c memory.h emulatorGlue.h
	$(CC) -c $(CFLAGS) -o memory.o memory.c $(CFLAGS)

ppu.o: ppu.c ppu.h emulatorGlue.h cpu.h window.h
	$(CC) -c $(CFLAGS) -o ppu.o ppu.c $(CFLAGS)

window.o: window.c window.h
	$(CC) -c $(CFLAGS) -o window.o window.c $(CFLAGS)

clear:
	rm *.o
