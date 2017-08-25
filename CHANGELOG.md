### 1.1.0
* Default to aem-orchestrator-1.0.0
* Update package build
* Support for Amazon Linux
* Parametrise the service user shell
* New configuration properties
    * `aem.relaxed.ssl.enable`
    * `http.client.relaxed.ssl.enable`
    * `aem.flush.logLevel`
    * `aem.replication.logLevel`
    * `aem.reverseReplication.logLevel`

### 1.0.0
* Update `aem_orchestrator::application_properties` to match `aem-orchestrator` commit `982665e`.
* Fix resource ordering so `application.properties` update triggers a service restart.
* Improved documentation

### 0.9.4
* Use the `puppet-archive` module to allow fetching JAR file from `S3`.

### 0.9.3
* Update `application_properties` to match latest `application.properties`
  ( https://github.com/shinesolutions/aem-orchestrator/tree/1bf330e )

### 0.9.2
* Added `application_properties` class.

* Added `tools/parse_application_properties` script to auto-generate
  `application_properties` class based on the Java project
  `application.properties` file.

### 0.9.1
* First functional version

### 0.9.0
* Initial version
