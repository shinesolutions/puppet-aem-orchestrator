APPLICATION_PROPERTIES_URL := "https://raw.githubusercontent.com/shinesolutions/aem-orchestrator/master/src/main/resources/application.properties"

ci: clean deps gen-properties test acceptance package

define python_venv
	. .venv/bin/activate && $(1)
endef

rmdeps:
	rm -rf .venv

deps:
	gem install bundler --version=4.0.22
	bundle install
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)

deps-upgrade:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

gen-properties:
	$(call python_venv,curl -sL $(APPLICATION_PROPERTIES_URL) | \
		tools/parse_application_properties \
			-p aem_orchestrator \
			-n application_properties \
			-)

clean:
	rm -rf bin/ pkg/ stage/ test/ vendor/

# lint, validate (syntax, metadata_lint), unit specs and static checks.
# safe.directory lets the git-based checks run as root in the buildenv container
test:
	GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0=$(CURDIR) \
		bundle exec rake test

lint:
	bundle exec rake lint syntax metadata_lint rubocop

# Run acceptance tests against every nodeset; beaker only runs one per invocation
acceptance:
	set -e; for nodeset in spec/acceptance/nodesets/*.yml; do \
		echo "== $$nodeset"; \
		BEAKER_SETFILE=$$nodeset bundle exec rake beaker; \
	done

# Regenerate the HTML reference in docs/ (published on GitHub Pages)
docs:
	bundle exec rake "strings:generate[,,,,,,--output-dir docs]"

# Move the Unreleased CHANGELOG.md entries to a release section, e.g. make changelog VERSION=2.0.2
# (VERSION defaults to metadata.json's version without its pre-release suffix)
changelog:
	bundle exec rake "changelog:release[$(VERSION)]"

package: deps
	bundle exec rake module:build

release:
	rtk release

.PHONY: APPLICATION_PROPERTIES_URL ci deps gen-properties clean test lint acceptance docs changelog package release
