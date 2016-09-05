# set default shell
SHELL := $(shell which bash)
ENV = /usr/bin/env
DKC = docker-compose
DK = docker
# default shell options
.SHELLFLAGS = -c

.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes execute in same shell
.NOTPARALLEL: ;          # wait for this target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell
default: all;   # default target

.PHONY: all volumes install build rm stop up _upd ps

all: install

install: volumes
install: rm
install: build

volumes:
	mkdir -p volumes/apps

build:
	$(ENV) $(DKC) build

rm: stop
rm:
	$(ENV) $(DKC) rm -f -v -a

stop:
	$(ENV) $(DKC) stop

up: _upd
up: ps

_upd:
	$(ENV) $(DKC) up -d

ps:
	$(ENV) $(DKC) ps
