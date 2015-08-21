# Go Concurrency Primitives

`gocp` (gossip?) is a C library that provides Go's concurrency primitives
as a shared library. For now, only goroutines and channels are supported.
The most important, `select`, is not supported, and is the most challenging.

Tested on Linux and Mac OS X. See the `Makefile` for details.
This is an experiment and has not been well tested, use at your own risk.

Requires Go 1.5.
