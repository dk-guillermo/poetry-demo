SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

POETRY := poetry
POETRYRUN := poetry run

.DEFAULT_GOAL := help

activate:
	$(POETRY) shell
.PHONY: activate

install:
	$(POETRY) install
.PHONY: install

# lint:
# 	$(POETRYRUN) pylint --disable=R,C poetry_demo tests
# .PHONY: lint

test:
	$(POETRYRUN) pytest tests
.PHONY: test

export:
	$(POETRY) export -f requirements.txt -o requirements.txt
.PHONY: test

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
.PHONY: help