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
	$(call python_venv,pylint tools/parse_application_properties)
	$(call python_venv,yamllint .markdownlint.yaml .github/workflows/*.yaml)
	markdownlint-cli2 README.md
	python3 -m json.tool .rtk.json

# Run acceptance tests against every nodeset; beaker only runs one per invocation
acceptance:
	set -e; for nodeset in spec/acceptance/nodesets/*.yml; do \
		echo "== $$nodeset"; \
		BEAKER_SETFILE=$$nodeset bundle exec rake beaker; \
	done

# Regenerate the HTML reference in docs/ (published on GitHub Pages)
docs:
	bundle exec rake "strings:generate[,,,,,,--output-dir docs]"

package: deps
	bundle exec rake module:build

release:
	rtk release

# Check the module is ready to publish to the Puppet Forge; reports what is missing.
# safe.directory lets the git-based checks run as root in the buildenv container
publish-check: package
	GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0=$(CURDIR) \
		tools/publish-check

# Publish the built package to the Puppet Forge, run by the publish workflow on a pushed tag.
# Requires BLACKSMITH_FORGE_API_KEY (a Forge API key) and a passing publish-check
publish: publish-check
	bundle exec rake module:push

.PHONY: APPLICATION_PROPERTIES_URL ci deps gen-properties clean test lint acceptance docs package release publish-check publish
