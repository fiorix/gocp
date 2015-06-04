# Copyright 2015 gocp authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

all: go libcp example

go:
	make -C go

libcp:
	rm -rf pkg
	GOPATH=`pwd` GOROOT=`pwd`/go/1.5 \
	go/1.5/bin/go install -buildmode=c-shared libgocp
	mv pkg/*/libgocp.a libgocp.so
	mv pkg/*/gocp.h gocp.h

example:
	cc -I pkg/*/ -o example example.c -lpthread \
	-L. -lgocp -Wl,-rpath=.

clean:
	rm -rf example

.PHONY: go
