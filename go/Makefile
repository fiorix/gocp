DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: 1.4 1.5

1.4:
	mkdir tmp
	curl -sL https://storage.googleapis.com/golang/go1.4.2.src.tar.gz | tar -zx -C tmp
	cd tmp/go/src && ./make.bash
	mv tmp/go 1.4
	rm -rf tmp

1.5:
	mkdir tmp
	git clone https://github.com/golang/go tmp/go
	cd tmp/go/src && GOROOT_BOOTSTRAP=$(DIR)/1.4 ./make.bash
	mv tmp/go 1.5
	rm -rf tmp

clean:
	rm -rf tmp 1.4 1.5
