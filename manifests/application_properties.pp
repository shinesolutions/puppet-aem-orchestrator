# == Class: aem_orchestrator::application_properties
#
# Write the `application.properties` file.
#
# === Parameters
#
# [*path*]
#   The path to the application.properties file on disk. Required.
#
# [*owner*]
#   The user that should own the application.properties file. This user is *not*
#   created by this module and should be managed elsewhere. Required.
#
# [*group*]
#   The group that should own the application.properties file. This group is
#   *not* created by this module and should be managed elsewhere. Required.
#
# [*mode*]
#   The mode of the application.properties file. Passed to the `file` resource.
#
# [*aem_client_api_connection_timeout*]
#   Java property `aem.client.api.connection.timeout`
#
# [*aem_client_api_debug*]
#   Java property `aem.client.api.debug`
#
# [*aem_credentials_orchestrator_password*]
#   Java property `aem.credentials.orchestrator.password`
#
# [*aem_credentials_orchestrator_username*]
#   Java property `aem.credentials.orchestrator.username`
#
# [*aem_credentials_replicator_password*]
#   Java property `aem.credentials.replicator.password`
#
# [*aem_credentials_replicator_username*]
#   Java property `aem.credentials.replicator.username`
#
# [*aem_credentials_s3_file_uri*]
#   Java property `aem.credentials.s3.file.uri`
#
# [*aem_credentials_s3_use*]
#   Java property `aem.credentials.s3.use`
#
# [*aem_port_author*]
#   Java property `aem.port.author`
#
# [*aem_port_author_dispatcher*]
#   Java property `aem.port.authorDispatcher`
#
# [*aem_port_publish*]
#   Java property `aem.port.publish`
#
# [*aem_port_publish_dispatcher*]
#   Java property `aem.port.publishDispatcher`
#
# [*aem_protocol_author*]
#   Java property `aem.protocol.author`
#
# [*aem_protocol_author_dispatcher*]
#   Java property `aem.protocol.authorDispatcher`
#
# [*aem_protocol_publish*]
#   Java property `aem.protocol.publish`
#
# [*aem_protocol_publish_dispatcher*]
#   Java property `aem.protocol.publishDispatcher`
#
# [*aem_reverse_replication_enable*]
#   Java property `aem.reverseReplication.enable`
#
# [*aem_reverse_replication_transport_uri_postfix*]
#   Java property `aem.reverseReplication.transportUri.postfix`
#
# [*aws_client_connection_timeout*]
#   Java property `aws.client.connection.timeout`
#
# [*aws_client_max_error_retry*]
#   Java property `aws.client.max.errorRetry`
#
# [*aws_client_protocol*]
#   Java property `aws.client.protocol`
#
# [*aws_client_proxy_host*]
#   Java property `aws.client.proxy.host`
#
# [*aws_client_proxy_port*]
#   Java property `aws.client.proxy.port`
#
# [*aws_client_use_proxy*]
#   Java property `aws.client.useProxy`
#
# [*aws_cloudformation_auto_scale_group_logical_id_author_dispatcher*]
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.authorDispatcher`
#
# [*aws_cloudformation_auto_scale_group_logical_id_publish*]
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.publish`
#
# [*aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher*]
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.publishDispatcher`
#
# [*aws_cloudformation_load_balancer_logical_id_author*]
#   Java property `aws.cloudformation.loadBalancer.logicalId.author`
#
# [*aws_cloudformation_stack_name_author*]
#   Java property `aws.cloudformation.stackName.author`
#
# [*aws_cloudformation_stack_name_author_dispatcher*]
#   Java property `aws.cloudformation.stackName.authorDispatcher`
#
# [*aws_cloudformation_stack_name_publish*]
#   Java property `aws.cloudformation.stackName.publish`
#
# [*aws_cloudformation_stack_name_publish_dispatcher*]
#   Java property `aws.cloudformation.stackName.publishDispatcher`
#
# [*aws_device_name*]
#   Java property `aws.device.name`
#
# [*aws_region*]
#   Java property `aws.region`
#
# [*aws_snapshot_tags*]
#   Java property `aws.snapshot.tags`
#
# [*aws_sqs_queue_name*]
#   Java property `aws.sqs.queueName`
#
# [*endpoints_enabled*]
#   Java property `endpoints.enabled`
#
# [*endpoints_health_enabled*]
#   Java property `endpoints.health.enabled`
#
# [*endpoints_info_enabled*]
#   Java property `endpoints.info.enabled`
#
# [*startup_wait_for_author_elb_back_off_period*]
#   Java property `startup.waitForAuthorElb.backOffPeriod`
#
# [*startup_wait_for_author_elb_max_attempts*]
#   Java property `startup.waitForAuthorElb.maxAttempts`
#
# === Examples
#
#  This is an internal class that isn't normally used. You can change values
#  for it's parameters using Hiera.
#
# === Authors
#
# This is an auto-generated class.
#
# === Copyright
#
# Copyright © 2017 Shine Solutions Group, unless otherwise noted.
#
class aem_orchestrator::application_properties (
  $path,
  $owner,
  $group,
  $mode,

  $aem_client_api_connection_timeout = undef,
  $aem_client_api_debug = undef,
  $aem_credentials_orchestrator_password = undef,
  $aem_credentials_orchestrator_username = undef,
  $aem_credentials_replicator_password = undef,
  $aem_credentials_replicator_username = undef,
  $aem_credentials_s3_file_uri = undef,
  $aem_credentials_s3_use = undef,
  $aem_port_author = undef,
  $aem_port_author_dispatcher = undef,
  $aem_port_publish = undef,
  $aem_port_publish_dispatcher = undef,
  $aem_protocol_author = undef,
  $aem_protocol_author_dispatcher = undef,
  $aem_protocol_publish = undef,
  $aem_protocol_publish_dispatcher = undef,
  $aem_reverse_replication_enable = undef,
  $aem_reverse_replication_transport_uri_postfix = undef,
  $aws_client_connection_timeout = undef,
  $aws_client_max_error_retry = undef,
  $aws_client_protocol = undef,
  $aws_client_proxy_host = undef,
  $aws_client_proxy_port = undef,
  $aws_client_use_proxy = undef,
  $aws_cloudformation_auto_scale_group_logical_id_author_dispatcher = undef,
  $aws_cloudformation_auto_scale_group_logical_id_publish = undef,
  $aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher = undef,
  $aws_cloudformation_load_balancer_logical_id_author = undef,
  $aws_cloudformation_stack_name_author = undef,
  $aws_cloudformation_stack_name_author_dispatcher = undef,
  $aws_cloudformation_stack_name_publish = undef,
  $aws_cloudformation_stack_name_publish_dispatcher = undef,
  $aws_device_name = undef,
  $aws_region = undef,
  $aws_snapshot_tags = undef,
  $aws_sqs_queue_name = undef,
  $endpoints_enabled = undef,
  $endpoints_health_enabled = undef,
  $endpoints_info_enabled = undef,
  $startup_wait_for_author_elb_back_off_period = undef,
  $startup_wait_for_author_elb_max_attempts = undef,

) {
  file { $path:
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('aem_orchestrator/application_properties.erb'),
  }
}
