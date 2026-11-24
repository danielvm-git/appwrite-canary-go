VERSION ?= $(shell cat VERSION 2>/dev/null || echo dev)
LDFLAGS = -ldflags "-X main.buildVersion=$(VERSION)"

.PHONY: build-site build-function
build-site:
	go build $(LDFLAGS) -o bin/site ./cmd/site

build-function:
	go build $(LDFLAGS) -o bin/function ./cmd/function