# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.0] - 2019-03-18
### Added
- Add basedirmode and installdirmode params to allow flexibility on directory permissions

## [1.3.1] - 2019-01-21
### Fixed
- Fix lint warning due to legacy fact usage

## [1.3.0] - 2019-01-20
### Added
- Add Amazon Linux 2 support using systemd to manage service

### Changed
- Upgrade default AEM Orchestrator to version 1.0.3

## [1.2.0] - 2018-05-07
### Added
- Add new properties startup_wait_for_author_elb_max_back_off_period and startup_wait_for_author_elb_back_off_period_multiplier
- Add new property alarm.content.health.check.terminate.instance.enable

## [1.1.0] - 2017-08-25
### Changed
- Default to aem-orchestrator-1.0.0
- Update package build
- Support for Amazon Linux
- Parametrise the service user shell
- New configuration properties, `aem.relaxed.ssl.enable`, `http.client.relaxed.ssl.enable`, `aem.flush.logLevel`, `aem.replication.logLevel`, `aem.reverseReplication.logLevel`

## [1.0.0] - 2017-03-31
### Changed
- Update `aem_orchestrator::application_properties` to match `aem-orchestrator` commit `982665e`.
- Fix resource ordering so `application.properties` update triggers a service restart.
- Improved documentation

## [0.9.4] - 2017-02-13
### Changed
- Use the `puppet-archive` module to allow fetching JAR file from `S3`.

## [0.9.3] - 2017-02-02
### Changed
- Update `application_properties` to match latest `application.properties` ( https://github.com/shinesolutions/aem-orchestrator/tree/1bf330e )

## [0.9.2] - 2017-02-02
### Added
- Added `application_properties` class.
- Added `tools/parse_application_properties` script to auto-generate `application_properties` class based on the Java project `application.properties` file.

## [0.9.1] - 2017-01-27
### Changed
- First functional version

## 0.9.0 - 2017-01-19
### Added
- Initial version

[1.4.0]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/1.3.1...1.4.0
[1.3.1]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/1.3.0...1.3.1
[1.3.0]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/1.0.0...1.1.0
[1.0.0]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/0.9.4...1.0.0
[0.9.4]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/0.9.3...0.9.4
[0.9.3]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/0.9.2...0.9.3
[0.9.2]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/0.9.1...0.9.2
[0.9.1]: https://github.com/shinesolutions/puppet-aem-orchestrator/compare/0.9.0...0.9.1
