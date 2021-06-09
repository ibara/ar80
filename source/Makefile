# ar80 Makefile

PROG =	ar80
OBJS =	app.o

DFLAGS =	-O2 -pipe -frelease -finline

all: ${OBJS}
	${DC} ${LDFLAGS} -o ../${PROG} ${OBJS}

clean:
	rm -f ../${PROG} ${OBJS}
