[![Build Status](https://img.shields.io/travis/shinesolutions/puppet-aem-orchestrator.svg)](http://travis-ci.org/shinesolutions/puppet-aem-orchestrator)

Puppet AEM Orchestrator
-----------------------

A Puppet module for provisioning [AEM Orchestrator](https://github.com/shinesolutions/aem-orchestrator).

Install
-------

    puppet module install shinesolutions-aem_orchestrator

Or via a Puppetfile:

    mod 'shinesolutions/aem_orchestrator'

If you want to use the master version:

    mod 'shinesolutions/aem_orchestrator', :git => 'https://github.com/shinesolutions/puppet-aem-orchestrator'

Configuration
-------------

TODO

Usage
-----

Just include the module:

```puppet
  include aem_orchestrator
```

Parameters can be set in YAML. See the defaults in `data/common.yaml` for
examples.

If you want to us an `S3` URL ( s3://_bucket_/_path_ ) you'll need to have the
AWS CLI installed and configured so `root` can run the command below without
error. This means you'll need to ensure AWS default credentials are configured
correctly. Information on how to set them up is detailed in [the AWS CLI
docs.](http://docs.aws.amazon.com/cli/latest/topic/config-vars.html)

```shell
aws s3 cp <url> /tmp/jar.tmp
```
