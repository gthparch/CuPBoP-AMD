all: avimod.o avilib.o
	$(AR) rcs libavi.a avimod.o avilib.o

# compile supporting function file into object (binary)
avimod.o: avilib.h avimod.c 
	$(CC) -c -fPIC avimod.c

# compile supporting function file into object (binary)
avilib.o: avilib.h avilib.c
	$(CC) -c -fPIC avilib.c

# delete files
clean:
	rm -f *.o *.a
