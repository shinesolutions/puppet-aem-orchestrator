APPLICATION_PROPERTIES_URL := "https://raw.githubusercontent.com/shinesolutions/aem-orchestrator/master/src/main/resources/application.properties"

ci: clean deps lint gen-properties package

deps:
	gem install bundler
	bundle install --binstubs
	pip install -r requirements.txt

gen-properties:
	curl -sL $(APPLICATION_PROPERTIES_URL) | \
	  tools/parse_application_properties \
		-p aem_orchestrator \
		-n application_properties \
		-

clean:
	rm -rf bin/ pkg/ stage/ test/ vendor/ *.lock

lint:
	bundle exec puppet-lint \
		--fail-on-warnings \
		--no-140chars-check \
		--no-autoloader_layout-check \
		--no-documentation-check \
		./manifests/*.pp
	# Enable template validation after migration from ERB templates to EPP templates.
	# puppet epp validate templates/*/*.epp
	mv Gemfile.lock Gemfile.lock.orig && pdk validate metadata && mv Gemfile.lock.orig Gemfile.lock

package: deps
	pdk build --force

release:
	rtk release

.PHONY: APPLICATION_PROPERTIES_URL ci deps gen-properties clean lint package release
