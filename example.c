// Copyright 2015 gocp authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include <stdio.h>
#include <unistd.h>

#include "gocp.h"

typedef struct {
	int id;
	GoChan c;
} data_t;

void f(void *args) {
	int i;
	data_t *d = (data_t*)(args);
	for (i=0;;i++) {
		int v = i*d->id;
		printf("Goroutine %d pushing item %d\n", d->id, v);
		ChanPush(d->c, &v);
		sleep(1);
	}
}

int main() {
	int i;
	data_t d[5];
	GoChan c = NewChan(0);
	for (i = 0; i < sizeof d / sizeof d[0]; i++) {
		d[i].id = i;
		d[i].c = c;
		Go(f, &d[i]);
	}
	for (;;) {
		int v = *(int*) ChanPop(c);
		printf("Got item %d\n", v);
	}
	//GoBlock();
	return 0;
}
