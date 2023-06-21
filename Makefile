# Makefile for cmdline

BASEDIR ?= $(PWD)
APPNAME ?= cmdline
APPVER ?= 2.3


.PHONY: all
all: build


.PHONY: buildx
buildx:
	docker buildx create --use --name $(APPNAME)-buildx


.PHONY: build
build:
	docker image build --tag $(APPNAME):dev $(BASEDIR)


.PHONY: run
run: build
	docker container run --rm --interactive --tty --volume "$$HOME":"/mnt/host/home" "$(APPNAME):dev"


.PHONY: publish
publish: build
	docker buildx build --push \
		--platform linux/amd64,linux/arm64 \
		--tag "jheddings/$(APPNAME):$(APPVER)" \
		--tag "jheddings/$(APPNAME):latest" \
		"$(BASEDIR)"


.PHONY: release
release: publish
	git tag "v$(APPVER)" main
	git push origin "v$(APPVER)"


.PHONY: clean
clean:
	docker image rm --force $(APPNAME):dev


.PHONY: clobber
clobber: clean
	docker image rm --force $(APPNAME):latest
