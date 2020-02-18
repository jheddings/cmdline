# Makefile for docker-shell

BASEDIR ?= $(PWD)

APPNAME ?= docker-shell
APPVER ?= 1.0

################################################################################
.PHONY: all

all: build

################################################################################
.PHONY: build

build: test
	docker image build --tag $(APPNAME):dev $(BASEDIR)

################################################################################
.PHONY: release

release: build
	docker image tag $(APPNAME):dev $(APPNAME):latest
	docker image tag $(APPNAME):latest $(APPNAME):$(APPVER)

################################################################################
.PHONY: test

test:

################################################################################
.PHONY: run

run: build
	docker container run --interactive --tty $(APPNAME):dev

################################################################################
.PHONY: clean

clean:
	docker image rm --force $(APPNAME):dev

################################################################################
.PHONY: clobber

clobber: clean
	docker image rm --force $(APPNAME):latest

