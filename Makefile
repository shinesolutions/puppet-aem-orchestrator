APPLICATION_PROPERTIES_URL := "https://raw.githubusercontent.com/shinesolutions/aem-orchestrator/master/src/main/resources/application.properties"

ci: clean deps gen-properties package

deps:
	gem install bundler --version=4.0.22
	bundle install
	pip install -r requirements.txt

gen-properties:
	curl -sL $(APPLICATION_PROPERTIES_URL) | \
	  tools/parse_application_properties \
		-p aem_orchestrator \
		-n application_properties \
		-

clean:
	rm -rf bin/ pkg/ stage/ test/ vendor/ *.lock

test:
	bundle exec rake test spec

lint:
	bundle exec rake lint
	# Enable template validation after migration from ERB templates to EPP templates.
	# puppet epp validate templates/*/*.epp
	@trap 'if [ -f Gemfile.lock.orig ]; then mv Gemfile.lock.orig Gemfile.lock; fi' EXIT; \
		if [ -f Gemfile.lock ]; then mv Gemfile.lock Gemfile.lock.orig; fi; \
		PDK_DISABLE_ANALYTICS=true pdk validate metadata

package: deps
	PDK_DISABLE_ANALYTICS=true pdk build --force

release:
	rtk release

.PHONY: APPLICATION_PROPERTIES_URL ci deps gen-properties clean lint package release
