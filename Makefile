# Makefile for cmdline

BASEDIR ?= $(PWD)
APPNAME ?= cmdline
APPVER ?= 2.8.0


.PHONY: all
all: build


.PHONY: build
build:
	docker image build --tag $(APPNAME):dev $(BASEDIR)


.PHONY: run
run: build
	docker container run --rm --interactive --tty --volume "$$HOME":"/mnt/host/home" "$(APPNAME):dev"


.PHONY: release
release:
	git tag "v$(APPVER)" main
	git push origin "v$(APPVER)"


.PHONY: clean
clean:
	docker image rm --force $(APPNAME):dev


.PHONY: clobber
clobber: clean
	docker image rm --force $(APPNAME):latest
