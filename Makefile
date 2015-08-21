# Copyright 2015 gocp authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Default build mode is c-shared, but it also works if you change
# to c-archive. On linux, you'll have to add -lpthread to LDFLAGS.

CFLAGS = -fPIC -Wall -I./pkg/*/
LDFLAGS = -L. -lgocp

OS := $(shell uname -s)
ifeq ($(OS),Darwin) # clang
	LDFLAGS += -Xlinker -rpath -Xlinker .
else
	LDFLAGS += -Wl,-rpath=$(LIBDIR)
endif

all: libcp example

libcp:
	GOPATH=`pwd` go install -buildmode=c-shared libgocp
	mv pkg/*/libgocp.a .
	mv pkg/*/gocp.h gocp.h

example:
	gcc $(CFLAGS) -o example example.c $(LDFLAGS)

clean:
	rm -rf pkg example gocp.h libgocp.a
