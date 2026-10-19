# @summary
#   Write the `application.properties` file.
#
# This class writes the `application.properties` file for the AEM
# Orchestrator. It is auto-generated and should not be modified by hand.
# Documentation for each of the properties can be found in the example
# `application.properties` from which it is generated. (see below)
#
# _Note:_ This is an internal class that shouldn't be used directly. It is
# included by the `aem_orchestrator` class. You can change values for its
# parameters using Hiera.
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
# @param aem_client_api_verifyssl
#   Java property `aem.client.api.verifyssl`
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
# @param aem_port_preview_publish
#   Java property `aem.port.previewPublish`
#
# @param aem_port_preview_publish_dispatcher
#   Java property `aem.port.previewPublishDispatcher`
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
# @param aem_protocol_preview_publish
#   Java property `aem.protocol.previewPublish`
#
# @param aem_protocol_preview_publish_dispatcher
#   Java property `aem.protocol.previewPublishDispatcher`
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
# @param aws_cloudformation_auto_scale_group_logical_id_preview_publish
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.previewPublish`
#
# @param aws_cloudformation_auto_scale_group_logical_id_preview_publish_dispatcher
#   Java property `aws.cloudformation.autoScaleGroup.logicalId.previewPublishDispatcher`
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
# @param aws_cloudformation_stack_name_preview_publish
#   Java property `aws.cloudformation.stackName.previewPublish`
#
# @param aws_cloudformation_stack_name_preview_publish_dispatcher
#   Java property `aws.cloudformation.stackName.previewPublishDispatcher`
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
# @param http_client_relaxed_ssl_enable
#   Java property `http.client.relaxed.ssl.enable`
#
# @param management_endpoints_web_exposure_include
#   Java property `management.endpoints.web.exposure.include`
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
# Copyright © 2017-2021 Shine Solutions Group, unless otherwise noted.
#
class aem_orchestrator::application_properties (
  String $path,
  String $owner,
  String $group,
  String $mode,

  Optional[String] $aem_client_api_connection_timeout = undef,
  Optional[String] $aem_client_api_debug = undef,
  Optional[String] $aem_client_api_verifyssl = undef,
  Optional[String] $aem_credentials_orchestrator_password = undef,
  Optional[String] $aem_credentials_orchestrator_username = undef,
  Optional[String] $aem_credentials_replicator_password = undef,
  Optional[String] $aem_credentials_replicator_username = undef,
  Optional[String] $aem_credentials_s3_file_uri = undef,
  Optional[String] $aem_credentials_s3_use = undef,
  Optional[String] $aem_flush_log_level = undef,
  Optional[String] $aem_port_author = undef,
  Optional[String] $aem_port_author_dispatcher = undef,
  Optional[String] $aem_port_preview_publish = undef,
  Optional[String] $aem_port_preview_publish_dispatcher = undef,
  Optional[String] $aem_port_publish = undef,
  Optional[String] $aem_port_publish_dispatcher = undef,
  Optional[String] $aem_protocol_author = undef,
  Optional[String] $aem_protocol_author_dispatcher = undef,
  Optional[String] $aem_protocol_preview_publish = undef,
  Optional[String] $aem_protocol_preview_publish_dispatcher = undef,
  Optional[String] $aem_protocol_publish = undef,
  Optional[String] $aem_protocol_publish_dispatcher = undef,
  Optional[String] $aem_relaxed_ssl_enable = undef,
  Optional[String] $aem_replication_log_level = undef,
  Optional[String] $aem_reverse_replication_enable = undef,
  Optional[String] $aem_reverse_replication_log_level = undef,
  Optional[String] $aem_reverse_replication_transport_uri_postfix = undef,
  Optional[String] $alarm_content_health_check_terminate_instance_enable = undef,
  Optional[String] $aws_client_connection_timeout = undef,
  Optional[String] $aws_client_max_error_retry = undef,
  Optional[String] $aws_client_protocol = undef,
  Optional[String] $aws_client_proxy_host = undef,
  Optional[String] $aws_client_proxy_port = undef,
  Optional[String] $aws_client_use_proxy = undef,
  Optional[String] $aws_cloudformation_auto_scale_group_logical_id_author_dispatcher = undef,
  Optional[String] $aws_cloudformation_auto_scale_group_logical_id_preview_publish = undef,
  Optional[String] $aws_cloudformation_auto_scale_group_logical_id_preview_publish_dispatcher = undef,
  Optional[String] $aws_cloudformation_auto_scale_group_logical_id_publish = undef,
  Optional[String] $aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher = undef,
  Optional[String] $aws_cloudformation_load_balancer_logical_id_author = undef,
  Optional[String] $aws_cloudformation_sns_logical_id_event_topic = undef,
  Optional[String] $aws_cloudformation_stack_name_author = undef,
  Optional[String] $aws_cloudformation_stack_name_author_dispatcher = undef,
  Optional[String] $aws_cloudformation_stack_name_messaging = undef,
  Optional[String] $aws_cloudformation_stack_name_preview_publish = undef,
  Optional[String] $aws_cloudformation_stack_name_preview_publish_dispatcher = undef,
  Optional[String] $aws_cloudformation_stack_name_publish = undef,
  Optional[String] $aws_cloudformation_stack_name_publish_dispatcher = undef,
  Optional[String] $aws_device_name = undef,
  Optional[String] $aws_region = undef,
  Optional[String] $aws_snapshot_tags = undef,
  Optional[String] $aws_sqs_queue_name = undef,
  Optional[String] $http_client_relaxed_ssl_enable = undef,
  Optional[String] $management_endpoints_web_exposure_include = undef,
  Optional[String] $startup_wait_for_author_elb_back_off_period = undef,
  Optional[String] $startup_wait_for_author_elb_back_off_period_multiplier = undef,
  Optional[String] $startup_wait_for_author_elb_max_attempts = undef,
  Optional[String] $startup_wait_for_author_elb_max_back_off_period = undef,
) {
  $properties = {
    'aem.client.api.connection.timeout'                                    => $aem_client_api_connection_timeout,
    'aem.client.api.debug'                                                 => $aem_client_api_debug,
    'aem.client.api.verifyssl'                                             => $aem_client_api_verifyssl,
    'aem.credentials.orchestrator.password'                                => $aem_credentials_orchestrator_password,
    'aem.credentials.orchestrator.username'                                => $aem_credentials_orchestrator_username,
    'aem.credentials.replicator.password'                                  => $aem_credentials_replicator_password,
    'aem.credentials.replicator.username'                                  => $aem_credentials_replicator_username,
    'aem.credentials.s3.file.uri'                                          => $aem_credentials_s3_file_uri,
    'aem.credentials.s3.use'                                               => $aem_credentials_s3_use,
    'aem.flush.logLevel'                                                   => $aem_flush_log_level,
    'aem.port.author'                                                      => $aem_port_author,
    'aem.port.authorDispatcher'                                            => $aem_port_author_dispatcher,
    'aem.port.previewPublish'                                              => $aem_port_preview_publish,
    'aem.port.previewPublishDispatcher'                                    => $aem_port_preview_publish_dispatcher,
    'aem.port.publish'                                                     => $aem_port_publish,
    'aem.port.publishDispatcher'                                           => $aem_port_publish_dispatcher,
    'aem.protocol.author'                                                  => $aem_protocol_author,
    'aem.protocol.authorDispatcher'                                        => $aem_protocol_author_dispatcher,
    'aem.protocol.previewPublish'                                          => $aem_protocol_preview_publish,
    'aem.protocol.previewPublishDispatcher'                                => $aem_protocol_preview_publish_dispatcher,
    'aem.protocol.publish'                                                 => $aem_protocol_publish,
    'aem.protocol.publishDispatcher'                                       => $aem_protocol_publish_dispatcher,
    'aem.relaxed.ssl.enable'                                               => $aem_relaxed_ssl_enable,
    'aem.replication.logLevel'                                             => $aem_replication_log_level,
    'aem.reverseReplication.enable'                                        => $aem_reverse_replication_enable,
    'aem.reverseReplication.logLevel'                                      => $aem_reverse_replication_log_level,
    'aem.reverseReplication.transportUri.postfix'                          => $aem_reverse_replication_transport_uri_postfix,
    'alarm.content.health.check.terminate.instance.enable'                 => $alarm_content_health_check_terminate_instance_enable,
    'aws.client.connection.timeout'                                        => $aws_client_connection_timeout,
    'aws.client.max.errorRetry'                                            => $aws_client_max_error_retry,
    'aws.client.protocol'                                                  => $aws_client_protocol,
    'aws.client.proxy.host'                                                => $aws_client_proxy_host,
    'aws.client.proxy.port'                                                => $aws_client_proxy_port,
    'aws.client.useProxy'                                                  => $aws_client_use_proxy,
    'aws.cloudformation.autoScaleGroup.logicalId.authorDispatcher'         => $aws_cloudformation_auto_scale_group_logical_id_author_dispatcher,
    'aws.cloudformation.autoScaleGroup.logicalId.previewPublish'           => $aws_cloudformation_auto_scale_group_logical_id_preview_publish,
    'aws.cloudformation.autoScaleGroup.logicalId.previewPublishDispatcher' => $aws_cloudformation_auto_scale_group_logical_id_preview_publish_dispatcher,
    'aws.cloudformation.autoScaleGroup.logicalId.publish'                  => $aws_cloudformation_auto_scale_group_logical_id_publish,
    'aws.cloudformation.autoScaleGroup.logicalId.publishDispatcher'        => $aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher,
    'aws.cloudformation.loadBalancer.logicalId.author'                     => $aws_cloudformation_load_balancer_logical_id_author,
    'aws.cloudformation.sns.logicalId.eventTopic'                          => $aws_cloudformation_sns_logical_id_event_topic,
    'aws.cloudformation.stackName.author'                                  => $aws_cloudformation_stack_name_author,
    'aws.cloudformation.stackName.authorDispatcher'                        => $aws_cloudformation_stack_name_author_dispatcher,
    'aws.cloudformation.stackName.messaging'                               => $aws_cloudformation_stack_name_messaging,
    'aws.cloudformation.stackName.previewPublish'                          => $aws_cloudformation_stack_name_preview_publish,
    'aws.cloudformation.stackName.previewPublishDispatcher'                => $aws_cloudformation_stack_name_preview_publish_dispatcher,
    'aws.cloudformation.stackName.publish'                                 => $aws_cloudformation_stack_name_publish,
    'aws.cloudformation.stackName.publishDispatcher'                       => $aws_cloudformation_stack_name_publish_dispatcher,
    'aws.device.name'                                                      => $aws_device_name,
    'aws.region'                                                           => $aws_region,
    'aws.snapshot.tags'                                                    => $aws_snapshot_tags,
    'aws.sqs.queueName'                                                    => $aws_sqs_queue_name,
    'http.client.relaxed.ssl.enable'                                       => $http_client_relaxed_ssl_enable,
    'management.endpoints.web.exposure.include'                            => $management_endpoints_web_exposure_include,
    'startup.waitForAuthorElb.backOffPeriod'                               => $startup_wait_for_author_elb_back_off_period,
    'startup.waitForAuthorElb.backOffPeriodMultiplier'                     => $startup_wait_for_author_elb_back_off_period_multiplier,
    'startup.waitForAuthorElb.maxAttempts'                                 => $startup_wait_for_author_elb_max_attempts,
    'startup.waitForAuthorElb.maxBackOffPeriod'                            => $startup_wait_for_author_elb_max_back_off_period,
  }

  file { $path:
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => epp('aem_orchestrator/application_properties.epp', {
      'properties' => $properties.filter |$key, $value| { $value =~ NotUndef },
    }),
  }
}
