APPLICATION_PROPERTIES_URL := "https://raw.githubusercontent.com/shinesolutions/aem-orchestrator/master/src/main/resources/application.properties"

ci: clean Gemfile.lock manifests/application_properties.pp
	bundle exec rake

Gemfile.lock: Gemfile
	bundle install

manifests/application_properties.pp:
	curl -sL $(APPLICATION_PROPERTIES_URL) | \
	  tools/parse_application_properties -p aem_orchestrator -n application_properties -

clean:
	rm -rf pkg test/integration/modules/

test-integration:
	echo "TODO"

build:
	puppet module build .

.PHONY: ci clean lint test-integration build tools manifests/application_properties.pp
