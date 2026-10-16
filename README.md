[![Build Status](https://github.com/shinesolutions/puppet-aem-orchestrator/workflows/CI/badge.svg)](https://github.com/shinesolutions/puppet-aem-orchestrator/actions?query=workflow%3ACI)

# shinesolutions-aem_orchestrator

A Puppet module for provisioning the Shine Solutions
[AEM Orchestrator](https://github.com/shinesolutions/aem-orchestrator): it installs
the AEM Orchestrator jar, writes its `application.properties` and runs it as a
systemd service.

Learn more about this module:

* [Installation](#installation)
* [Usage](#usage)
* [Result Model](#result-model)
* [Error Handling](#error-handling)
* [Testing](#testing)
* [Versions History](#versions-history)

## Installation

Requirements:

* Puppet or OpenVox 7, 8 or 9
* Amazon Linux 2023 or Rocky Linux 10
* Java 21 at `/usr/bin/java`, which runs the jar
* The [puppet/archive](https://forge.puppet.com/modules/puppet/archive) module,
  installed automatically as a dependency
* If you use an `S3` URL ( s3://_bucket_/_path_ ) for the jar file source, the
  AWS CLI installed and configured so `root` can run the command below without
  error. This means you'll need to ensure AWS default credentials are configured
  correctly, as described in
  [the AWS CLI docs](http://docs.aws.amazon.com/cli/latest/topic/config-vars.html).

      aws s3 cp <url> /tmp/jar.tmp

Install the module using the `puppet` command:

    puppet module install shinesolutions-aem_orchestrator

Or via a Puppetfile:

    mod 'shinesolutions-aem_orchestrator'

Or if you want to use the newest code from git:

    mod 'shinesolutions-aem_orchestrator', :git => 'https://github.com/shinesolutions/puppet-aem-orchestrator'

## Usage

Include the module in your Puppet code:

    include aem_orchestrator

Parameters can be set with Hiera. See the defaults in `data/common.yaml` for
examples.

Most default parameters are correct, but you will likely need to override the
following to point to the AEM Orchestrator jar file:

    aem_orchestrator::jarfile_source: (s3|http|file)://(host|bucket)/path/to/aem_orchestrator.jar
    aem_orchestrator::jarfile_checksum_value: <sha256 hash of aem_orchestrator.jar>

AEM Orchestrator settings are set with the `aem_orchestrator::application_properties`
class parameters, one per property, e.g. `aws.sqs.queueName` is set with:

    aem_orchestrator::application_properties::aws_sqs_queue_name: example-aem-asg-event-queue

The module's classes and their parameters are documented in the comments in
each manifest file. HTML documentation generated with `puppet strings` can be
found in the `docs/` folder -- which is published on [GitHub
Pages](https://shinesolutions.github.io/puppet-aem-orchestrator/) for easy
reference.

## Result Model

With the default parameters, applying `aem_orchestrator` results in:

| Resource | Default |
|---|---|
| System user and group | `aem-orchestrator`, home `/opt/shinesolutions/aem-orchestrator`, shell `/usr/sbin/nologin` |
| Base directory | `/opt/shinesolutions` |
| Jar file | `/opt/shinesolutions/aem-orchestrator/aem-orchestrator.jar`, downloaded from `jarfile_source` and verified against `jarfile_checksum_value`, mode `0500` |
| systemd unit | `/etc/systemd/system/aem-orchestrator.service`, running `java -jar` on the jar as the service user, with `AWS_PROFILE` set when `aws_profile` is given |
| Application properties | `/opt/shinesolutions/aem-orchestrator/application.properties`, mode `0400`, containing only the properties that are set |
| Service | `aem-orchestrator`, running and enabled at boot |

A change to the application properties restarts the service. The user, group,
base directory and home directory are only managed when their `manage_*`
parameters are `true` (the default, except `manage_installdir`).

## Error Handling

The Puppet run fails when:

* The operating system family is not RedHat (Amazon Linux and Rocky Linux are
  RedHat family).
* The jar can't be downloaded from `jarfile_source`, e.g. an `S3` URL without
  working AWS CLI credentials for `root`.
* The downloaded jar doesn't match `jarfile_checksum_value`.

Puppet only checks that the service has started. The AEM Orchestrator exits
shortly after starting when its AWS configuration is missing or wrong, e.g. the
CloudFormation stack names or SQS queue in `application.properties`; check its
log with `journalctl -u aem-orchestrator`.

## Testing

Run the commands below in
[aem-platform-buildenv](https://github.com/shinesolutions/aem-platform-buildenv),
as CI does. Install the Ruby gems and the Python tools first:

    make deps

| Command | Runs |
|---|---|
| `make test` | Lint, syntax and `metadata.json` checks, unit specs and static checks |
| `make lint` | Puppet lint, syntax, `metadata.json` lint, RuboCop and pylint only |
| `make acceptance` | Acceptance tests with Beaker on every nodeset in `spec/acceptance/nodesets` (Amazon Linux 2023 and Rocky Linux 10), in Docker containers |
| `make ci` | Everything CI runs: deps, application properties generation, unit and acceptance tests, and packaging |
| `make docs` | Regenerate the HTML reference in `docs/` |

## Versions History

See [CHANGELOG.md](CHANGELOG.md) for the changes in each version.

Releases are published to the [Puppet Forge](https://forge.puppet.com/modules/shinesolutions/aem_orchestrator)
and tagged `<version>` in git. Between releases, `metadata.json` holds the next
pre-release version, e.g. `2.0.2-pre.0`. To release:

1. Check that the `## [Unreleased]` entries in CHANGELOG.md on `main` describe
   everything in this release.
2. In GitHub Actions, run the **Release Major**, **Release Minor** or **Release
   Patch** workflow. It uses [RTK](https://github.com/cliffano/rtk), configured
   in `.rtk.json`, to set the release version in `metadata.json` and CHANGELOG.md,
   commit and tag it `<version>`, commit the next pre-release version, and push
   the commits and the tag. To do the same locally, run `make release` in
   aem-platform-buildenv, then push the commits and the tag.
3. The pushed tag triggers the **Publish Puppet Module** workflow, which builds
   the module and runs `make publish`: `make publish-check` checks the module is
   ready, then the package is pushed to the Forge. Publishing needs a Forge API
   key in `BLACKSMITH_FORGE_API_KEY`.
