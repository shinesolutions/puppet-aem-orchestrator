# @summary
#   Write the `application.properties` file.
#
#  This class writes the `application.properties` file for the AEM
#  Orchestrator. It is auto-generated and should not be modified by hand.
#  Documentation for each of the properties can be found in the example
#  `application.properties` from which it is generated. (see below)
#
#  _Note:_ This is an internal class that shouldn't be used directly. It is
#  included by the `aem_orchestrator` class. You can change values for it's
#  parameters using Hiera.
#
# @see https://github.com/shinesolutions/aem-orchestrator/blob/master/src/main/resources/application.properties
#   The example AEM Orchestrator file.
#
# @param path
#   The path to the application.properties file on disk. Required.
#
# @param owner
#   The user that should own the application.properties file. This user is *not*
#   created by this module and should be managed elsewhere. Required.
#
# @param group
#   The group that should own the application.properties file. This group is
#   *not* created by this module and should be managed elsewhere. Required.
#
# @param mode
#   The mode of the application.properties file. Passed to the `file` resource.
#
# @param aem_client_api_connection_timeout
#   Java property `aem.client.api.connection.timeout`
#
# @param aem_client_api_debug
#   Java property `aem.client.api.debug`
#
# @param aem_credentials_orchestrator_password
#   Java property `aem.credentials.orchestrator.password`
#
# @param aem_credentials_orchestrator_username
#   Java property `aem.credentials.orchestrator.username`
#
# @param aem_credentials_replicator_password
#   Java property `aem.credentials.replicator.password`
#
# @param aem_credentials_replicator_username
#   Java property `aem.credentials.replicator.username`
#
# @param aem_credentials_s3_file_uri
#   Java property `aem.credentials.s3.file.uri`
#
# @param aem_credentials_s3_use
#   Java property `aem.credentials.s3.use`
#
# @param aem_flush_log_level
#   Java property `aem.flush.logLevel`
#
# @param aem_port_author
#   Java property `aem.port.author`
#
# @param aem_port_author_dispatcher
#   Java property `aem.port.authorDispatcher`
#
# @param aem_port_publish
#   Java property `aem.port.publish`
#
# @param aem_port_publish_dispatcher
#   Java property `aem.port.publishDispatcher`
#
# @param aem_protocol_author
#   Java property `aem.protocol.author`
#
# @param aem_protocol_author_dispatcher
#   Java property `aem.protocol.authorDispatcher`
#
# @param aem_protocol_publish
#   Java property `aem.protocol.publish`
#
# @param aem_protocol_publish_dispatcher
#   Java property `aem.protocol.publishDispatcher`
#
# @param aem_relaxed_ssl_enable
#   Java property `aem.relaxed.ssl.enable`
#
# @param aem_replication_log_level
#   Java property `aem.replication.logLevel`
#
# @param aem_reverse_replication_enable
#   Java property `aem.reverseReplication.enable`
#
# @param aem_reverse_replication_log_level
#   Java property `aem.reverseReplication.logLevel`
#
# @param aem_reverse_replication_transport_uri_postfix
#   Java property `aem.reverseReplication.transportUri.postfix`
#
# @param alarm_content_health_check_terminate_instance_enable
#   Java property `alarm.content.health.check.terminate.instance.enable`
#
# @param aws_client_connection_timeout
#   Java property `aws.client.connection.timeout`
#
# @param aws_client_max_error_retry
#   Java property `aws.client.max.errorRetry`
#
# @param aws_client_protocol
#   Java property `aws.client.protocol`
#
# @param aws_client_proxy_host
#   Java property `aws.client.proxy.host`
#
# @param aws_client_proxy_port
#   Java property `aws.client.proxy.port`
#
# @param aws_client_use_proxy
#   Java property `aws.client.useProxy`
#
# @param aws_cloudformation_auto_scale_group_logical_id_author_dispatcher
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.authorDispatcher`
#
# @param aws_cloudformation_auto_scale_group_logical_id_publish
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.publish`
#
# @param aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.publishDispatcher`
#
# @param aws_cloudformation_load_balancer_logical_id_author
#   Java property `aws.cloudformation.loadBalancer.logicalId.author`
#
# @param aws_cloudformation_sns_logical_id_event_topic
#   Java property `aws.cloudformation.sns.logicalId.eventTopic`
#
# @param aws_cloudformation_stack_name_author
#   Java property `aws.cloudformation.stackName.author`
#
# @param aws_cloudformation_stack_name_author_dispatcher
#   Java property `aws.cloudformation.stackName.authorDispatcher`
#
# @param aws_cloudformation_stack_name_messaging
#   Java property `aws.cloudformation.stackName.messaging`
#
# @param aws_cloudformation_stack_name_publish
#   Java property `aws.cloudformation.stackName.publish`
#
# @param aws_cloudformation_stack_name_publish_dispatcher
#   Java property `aws.cloudformation.stackName.publishDispatcher`
#
# @param aws_device_name
#   Java property `aws.device.name`
#
# @param aws_region
#   Java property `aws.region`
#
# @param aws_snapshot_tags
#   Java property `aws.snapshot.tags`
#
# @param aws_sqs_queue_name
#   Java property `aws.sqs.queueName`
#
# @param endpoints_enabled
#   Java property `endpoints.enabled`
#
# @param endpoints_health_enabled
#   Java property `endpoints.health.enabled`
#
# @param endpoints_info_enabled
#   Java property `endpoints.info.enabled`
#
# @param http_client_relaxed_ssl_enable
#   Java property `http.client.relaxed.ssl.enable`
#
# @param startup_wait_for_author_elb_back_off_period
#   Java property `startup.waitForAuthorElb.backOffPeriod`
#
# @param startup_wait_for_author_elb_back_off_period_multiplier
#   Java property `startup.waitForAuthorElb.backOffPeriodMultiplier`
#
# @param startup_wait_for_author_elb_max_attempts
#   Java property `startup.waitForAuthorElb.maxAttempts`
#
# @param startup_wait_for_author_elb_max_back_off_period
#   Java property `startup.waitForAuthorElb.maxBackOffPeriod`
#
#
# Copyright © 2017-2019 Shine Solutions Group, unless otherwise noted.
#
class aem_orchestrator::application_properties (
  String $path,
  String $owner,
  String $group,
  String $mode,

  Variant[String, Undef] $aem_client_api_connection_timeout = undef,
  Variant[String, Undef] $aem_client_api_debug = undef,
  Variant[String, Undef] $aem_credentials_orchestrator_password = undef,
  Variant[String, Undef] $aem_credentials_orchestrator_username = undef,
  Variant[String, Undef] $aem_credentials_replicator_password = undef,
  Variant[String, Undef] $aem_credentials_replicator_username = undef,
  Variant[String, Undef] $aem_credentials_s3_file_uri = undef,
  Variant[String, Undef] $aem_credentials_s3_use = undef,
  Variant[String, Undef] $aem_flush_log_level = undef,
  Variant[String, Undef] $aem_port_author = undef,
  Variant[String, Undef] $aem_port_author_dispatcher = undef,
  Variant[String, Undef] $aem_port_publish = undef,
  Variant[String, Undef] $aem_port_publish_dispatcher = undef,
  Variant[String, Undef] $aem_protocol_author = undef,
  Variant[String, Undef] $aem_protocol_author_dispatcher = undef,
  Variant[String, Undef] $aem_protocol_publish = undef,
  Variant[String, Undef] $aem_protocol_publish_dispatcher = undef,
  Variant[String, Undef] $aem_relaxed_ssl_enable = undef,
  Variant[String, Undef] $aem_replication_log_level = undef,
  Variant[String, Undef] $aem_reverse_replication_enable = undef,
  Variant[String, Undef] $aem_reverse_replication_log_level = undef,
  Variant[String, Undef] $aem_reverse_replication_transport_uri_postfix = undef,
  Variant[String, Undef] $alarm_content_health_check_terminate_instance_enable = undef,
  Variant[String, Undef] $aws_client_connection_timeout = undef,
  Variant[String, Undef] $aws_client_max_error_retry = undef,
  Variant[String, Undef] $aws_client_protocol = undef,
  Variant[String, Undef] $aws_client_proxy_host = undef,
  Variant[String, Undef] $aws_client_proxy_port = undef,
  Variant[String, Undef] $aws_client_use_proxy = undef,
  Variant[String, Undef] $aws_cloudformation_auto_scale_group_logical_id_author_dispatcher = undef,
  Variant[String, Undef] $aws_cloudformation_auto_scale_group_logical_id_publish = undef,
  Variant[String, Undef] $aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher = undef,
  Variant[String, Undef] $aws_cloudformation_load_balancer_logical_id_author = undef,
  Variant[String, Undef] $aws_cloudformation_sns_logical_id_event_topic = undef,
  Variant[String, Undef] $aws_cloudformation_stack_name_author = undef,
  Variant[String, Undef] $aws_cloudformation_stack_name_author_dispatcher = undef,
  Variant[String, Undef] $aws_cloudformation_stack_name_messaging = undef,
  Variant[String, Undef] $aws_cloudformation_stack_name_publish = undef,
  Variant[String, Undef] $aws_cloudformation_stack_name_publish_dispatcher = undef,
  Variant[String, Undef] $aws_device_name = undef,
  Variant[String, Undef] $aws_region = undef,
  Variant[String, Undef] $aws_snapshot_tags = undef,
  Variant[String, Undef] $aws_sqs_queue_name = undef,
  Variant[String, Undef] $endpoints_enabled = undef,
  Variant[String, Undef] $endpoints_health_enabled = undef,
  Variant[String, Undef] $endpoints_info_enabled = undef,
  Variant[String, Undef] $http_client_relaxed_ssl_enable = undef,
  Variant[String, Undef] $startup_wait_for_author_elb_back_off_period = undef,
  Variant[String, Undef] $startup_wait_for_author_elb_back_off_period_multiplier = undef,
  Variant[String, Undef] $startup_wait_for_author_elb_max_attempts = undef,
  Variant[String, Undef] $startup_wait_for_author_elb_max_back_off_period = undef,

) {
  file { $path:
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('aem_orchestrator/application_properties.erb'),
  }
}
