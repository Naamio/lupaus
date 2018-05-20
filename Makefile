SHELL := /bin/bash

UNAME = ${shell uname}

clean:
	if	[ -d ".build" ]; then \
		rm -rf .build ; \
	fi

build: clean
	swift build

test:
	swift test

build-release: clean
	docker run -v $$(pwd):/tmp/naamio -w /tmp/lupaus -it ibmcom/swift-ubuntu:4.1 swift build -c release -Xcc -fblocks -Xlinker -L/usr/local/lib -Xswiftc -whole-module-optimization

.PHONY: build test run
