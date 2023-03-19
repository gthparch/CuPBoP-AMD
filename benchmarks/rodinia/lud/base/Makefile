all:
	$(CC) -o lud_base.o -I../common -fPIC -c lud_base.c
	$(CC) -o lud.o -I../common -fPIC -c lud.c
	$(AR) rcs libludbase.a lud.o lud_base.o

clean:
	rm -f *.o *.a
