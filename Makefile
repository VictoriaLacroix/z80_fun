ASM   = rgbasm
LINK  = rgblink

cart.gbc: main.o
	$(LINK) -ocart.gbc main.o

main.o: main.asm
	$(ASM) -omain.o main.asm

clean:
	rm *.o *.gbc

