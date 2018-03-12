NAME     := echoservice
VERSION  := v1.0.0
REVISION := $(shell git rev-parse --short HEAD)

SRCS     := $(shell find . -type f -name '*.go')
LDFLAGS  := -ldflags="-s -w -X \"main.version=$(VERSION)\" -X \"main.revision=$(REVISION)\" -extldflags \"-static\""
NOVENDOR := $(shell go list ./... | grep -v vendor)

.DEFAULT_GOAL := bin/$(NAME)

bin/$(NAME): $(SRCS)
	go build $(LDFLAGS) -o bin/$(NAME)

.PHONY: install
install:
	go install $(LDFLAGS)

.PHONY: test
test:
	go test -cover -v $(NOVENDOR)
