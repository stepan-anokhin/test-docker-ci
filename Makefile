.PHONY: build test

GIT_HASH := $(shell git rev-parse --short HEAD)

build:
	sudo docker build . -t ci-example --build-arg GIT_HASH=$(GIT_HASH) --target prod

test:
	sudo docker build . --build-arg GIT_HASH=$(GIT_HASH) --target tests
