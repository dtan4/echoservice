NAME     := echoservice
VERSION  := v1.0.0
REVISION := $(shell git rev-parse --short HEAD)

SRCS     := $(shell find . -type f -name '*.go')
LDFLAGS  := -ldflags="-s -w -X \"main.version=$(VERSION)\" -X \"main.revision=$(REVISION)\" -extldflags \"-static\""
NOVENDOR := $(shell go list ./... | grep -v vendor)

DOCKER_IMAGE := dtan4/echoservice

.DEFAULT_GOAL := bin/$(NAME)

bin/$(NAME): $(SRCS)
	go build $(LDFLAGS) -o bin/$(NAME)

.PHONY: docker-build
docker-build:
ifeq ($(findstring ELF 64-bit LSB,$(shell file bin/$(NAME) 2> /dev/null)),)
	@echo "bin/$(NAME) is not a Linux 64bit binary."
	@exit 1
endif
	docker build -t $(DOCKER_IMAGE) .

.PHONY: docker-run
docker-run:
	docker run --rm -p 8080:8080 $(DOCKER_IMAGE)

.PHONY: install
install:
	go install $(LDFLAGS)

.PHONY: test
test:
	go test -cover -v $(NOVENDOR)
