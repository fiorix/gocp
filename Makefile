# Copyright 2015 gocp authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# Supported build modes are c-shared or c-archive.
BUILDMODE = c-shared
OS = $(shell go env GOOS)
ARCH = $(shell go env GOARCH)

CFLAGS = -fPIC -Wall
LDFLAGS = -L. -lgocp

ifeq ($(OS),darwin) # clang
	PKGDIR = ./pkg/$(OS)_$(ARCH)
	LDFLAGS += -Xlinker -rpath -Xlinker .
endif

ifeq ($(OS),linux)
	ifeq ($(BUILDMODE),c-shared)
		PKGDIR = ./pkg/$(OS)_$(ARCH)_shared
		LDFLAGS += -Wl,-rpath=.
	else
		PKGDIR = ./pkg/$(OS)_$(ARCH)
		LDFLAGS += -Wl,-rpath=. -lpthread
	endif
endif

all: libcp example

libcp:
	GOPATH=$(PWD) go install -buildmode=$(BUILDMODE) libgocp
	ln -sf $(PKGDIR)/libgocp.a .
	ln -sf $(PKGDIR)/gocp.h .

example:
	gcc $(CFLAGS) -o example example.c $(LDFLAGS)

clean:
	rm -rf pkg gocp.h libgocp.a example
