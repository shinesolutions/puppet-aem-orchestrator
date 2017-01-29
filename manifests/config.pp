# == Class: aem_orchestrator::config
#
# A parameter-only class used by the `aem_orchestrator` class for configuration
# values.
#
# === Parameters
#
# [*endpoints_enabled*]
#   A parameter
#
# [*endpoints_health_enabled*]
#   A parameter
#
# [*aws_client_protocol*]
#   A parameter
#
# [*aws_client_proxy_host*]
#   A parameter
#
# [*aws_client_proxy_port*]
#   A parameter
#
# [*aws_client_connection_timeout*]
#   A parameter
#
# [*aws_client_error_retry*]
#   A parameter
#
# [*sqs_queue_name*]
#   A parameter
#
# [*orchestrator_username*]
#   A parameter
#
# [*orchestrator_password*]
#   A parameter
#
# [*replicator_username*]
#   A parameter
#
# [*replicator_password*]
#   A parameter
#
# [*publisher_dispatcher_group_name*]
#   A parameter
#
# [*publisher_dispatcher_protocol*]
#   A parameter
#
# [*publisher_dispatcher_port*]
#   A parameter
#
# [*publisher_group_name*]
#   A parameter
#
# [*publisher_protocol*]
#   A parameter
#
# [*publisher_port*]
#   A parameter
#
# [*author_dispatcher_group_name*]
#   A parameter
#
# [*author_dispatcher_protocol*]
#   A parameter
#
# [*author_dispatcher_port*]
#   A parameter
#
# === Examples
#
#  This is an internal class that isn't normally used. You can change values
#  for it's parameters using Hiera.
#
# === Authors
#
# James Sinclair <james.sinclair@shinesolutions.com>
#
# === Copyright
#
# Copyright © 2017	Shine Solutions Group, unless otherwise noted.
#
class aem_orchestrator::config (
  $endpoints_enabled = undef,
  $endpoints_health_enabled = undef,

  $aws_client_protocol = undef,
  $aws_client_proxy_host = undef,
  $aws_client_proxy_port = undef,
  $aws_client_connection_timeout = undef,
  $aws_client_error_retry = undef,

  $sqs_queue_name = undef,

  $orchestrator_username = undef,
  $orchestrator_password = undef,

  $replicator_username = undef,
  $replicator_password = undef,

  $publisher_dispatcher_group_name = undef,
  $publisher_dispatcher_protocol = undef,
  $publisher_dispatcher_port = undef,

  $publisher_group_name = undef,
  $publisher_protocol = undef,
  $publisher_port = undef,

  $author_dispatcher_group_name = undef,
  $author_dispatcher_protocol = undef,
  $author_dispatcher_port = undef,
) {}
