# Installation directories

# Default installation prefix
PREFIX=/usr/local

# System's libraries directory (where binary libraries are installed)
LUA_LIBDIR= $(PREFIX)/lib/lua/5.1

# Lua includes directory
LUA_INC += -I$(PREFIX)/include
LUA_INC += -I/usr/include/lua5.1

# OS dependent
LIB_OPTION= -shared #for Linux
#LIB_OPTION= -bundle -undefined dynamic_lookup #for MacOS X

LIBNAME= $T.so.$V

# Compilation directives
WARN= -O2 -Wall -fPIC -W -Waggregate-return -Wcast-align -Wmissing-prototypes -Wnested-externs -Wshadow -Wwrite-strings -pedantic
INCS= $(LUA_INC)
CFLAGS= $(WARN) $(INCS)
CC= gcc

T= signal

OBJS= lsignal.o

signal.so: $(OBJS)
	MACOSX_DEPLOYMENT_TARGET="10.3"; export MACOSX_DEPLOYMENT_TARGET; $(CC) $(LIB_OPTION) -o signal.so $(OBJS)

install:
	mkdir -p $(DESTDIR)$(LUA_LIBDIR)
	cp signal.so $(DESTDIR)$(LUA_LIBDIR)

clean:
	rm -f signal.so $(OBJS)

