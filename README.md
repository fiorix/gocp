# Go Concurrency Primitives

`gocp` (gossip?) is a C library that provides Go's concurrency primitives
as a shared library. For now, only goroutines and channels are supported.
The most important, `select`, is not supported, and is the most challenging.

Currently works on Linux. It's possible to compile it as an archive for
OS X by updating the Makefile (change `c-shared` to `c-archive`).

This is an experiment and has not been very tested, use at your own risk.
