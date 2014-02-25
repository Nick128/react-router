BIN = ./node_modules/.bin
REPO = $(shell cat .git/config | grep url | xargs echo | sed -E 's/^url = //g')
REPONAME = $(shell echo $(REPO) | sed -E 's_.+:([a-zA-Z0-9_\-]+)/([a-zA-Z0-9_\-]+)\.git_\1/\2_')

install link:
	@npm $@

lint:
	@$(BIN)/jshint index.js async.js lib/*.js

test: test-unit test-server

test-unit:
	@$(BIN)/mocha -R spec -b tests/matchRoutes.js

test-server:
	@$(BIN)/mocha -R spec -b tests/server.js

test-local:
	@$(BIN)/zuul --local 3000  -- tests/browser.js

test-cloud:
	@$(BIN)/zuul -- tests/browser.js

release-patch: test lint
	@$(call release,patch)

release-minor: test lint
	@$(call release,minor)

release-major: test lint
	@$(call release,major)

publish:
	git push --tags origin HEAD:master
	npm publish

define release
	npm version $(1)
endef
