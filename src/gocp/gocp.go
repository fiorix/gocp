// Copyright 2015 gocp authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Package gocp provides Go Concurrency Primitives as a C library.
package gocp // import "gocp"

// typedef void* voidPtr;
// typedef void (*voidFunc) (voidPtr);
// extern void bridge_void_func(voidFunc f, voidPtr args);
import "C"

// Go runs f as a goroutine.
//
//export Go
func Go(f C.voidFunc, args C.voidPtr) {
	go C.bridge_void_func(f, args)
}

// GoBlock causes the goroutine to block forever.
//
//export GoBlock
func GoBlock() {
	select {}
}

// Chan is a Go channel.
//
//export Chan
type Chan chan interface{}

// NewChan creates and initializes a new Chan.
//
//export NewChan
func NewChan(buffsize C.int) Chan {
	return make(chan interface{}, buffsize)
}

// ChanPush writes data to channel c, blocking if necessary.
//
//export ChanPush
func ChanPush(c Chan, d C.voidPtr) {
	c <- d
}

// ChanPop reads data from channel c, blocking if necessary.
//
//export ChanPop
func ChanPop(c Chan) C.voidPtr {
	return (<-c).(C.voidPtr)
}
