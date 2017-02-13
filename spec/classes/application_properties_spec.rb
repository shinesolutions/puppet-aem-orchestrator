require 'spec_helper'
describe 'aem_orchestrator::application_properties' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('aem_orchestrator::application_properties') }
  end
  context 'with aem_client_api_connection_timeout => foo' do
    let(:params) { {:aem_client_api_connection_timeout => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.client.api.connection.timeout = foo/) }
  end
  context 'with aem_client_api_debug => foo' do
    let(:params) { {:aem_client_api_debug => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.client.api.debug = foo/) }
  end
  context 'with aem_credentials_orchestrator_password => foo' do
    let(:params) { {:aem_credentials_orchestrator_password => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.credentials.orchestrator.password = foo/) }
  end
  context 'with aem_credentials_orchestrator_username => foo' do
    let(:params) { {:aem_credentials_orchestrator_username => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.credentials.orchestrator.username = foo/) }
  end
  context 'with aem_credentials_replicator_password => foo' do
    let(:params) { {:aem_credentials_replicator_password => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.credentials.replicator.password = foo/) }
  end
  context 'with aem_credentials_replicator_username => foo' do
    let(:params) { {:aem_credentials_replicator_username => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.credentials.replicator.username = foo/) }
  end
  context 'with aem_credentials_s3_file_uri => foo' do
    let(:params) { {:aem_credentials_s3_file_uri => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.credentials.s3.file.uri = foo/) }
  end
  context 'with aem_credentials_s3_use => foo' do
    let(:params) { {:aem_credentials_s3_use => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.credentials.s3.use = foo/) }
  end
  context 'with aem_port_author => foo' do
    let(:params) { {:aem_port_author => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.port.author = foo/) }
  end
  context 'with aem_port_author_dispatcher => foo' do
    let(:params) { {:aem_port_author_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.port.authorDispatcher = foo/) }
  end
  context 'with aem_port_publish => foo' do
    let(:params) { {:aem_port_publish => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.port.publish = foo/) }
  end
  context 'with aem_port_publish_dispatcher => foo' do
    let(:params) { {:aem_port_publish_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.port.publishDispatcher = foo/) }
  end
  context 'with aem_protocol_author => foo' do
    let(:params) { {:aem_protocol_author => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.protocol.author = foo/) }
  end
  context 'with aem_protocol_author_dispatcher => foo' do
    let(:params) { {:aem_protocol_author_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.protocol.authorDispatcher = foo/) }
  end
  context 'with aem_protocol_publish => foo' do
    let(:params) { {:aem_protocol_publish => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.protocol.publish = foo/) }
  end
  context 'with aem_protocol_publish_dispatcher => foo' do
    let(:params) { {:aem_protocol_publish_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aem.protocol.publishDispatcher = foo/) }
  end
  context 'with aws_client_connection_timeout => foo' do
    let(:params) { {:aws_client_connection_timeout => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.client.connection.timeout = foo/) }
  end
  context 'with aws_client_max_error_retry => foo' do
    let(:params) { {:aws_client_max_error_retry => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.client.max.errorRetry = foo/) }
  end
  context 'with aws_client_protocol => foo' do
    let(:params) { {:aws_client_protocol => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.client.protocol = foo/) }
  end
  context 'with aws_client_proxy_host => foo' do
    let(:params) { {:aws_client_proxy_host => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.client.proxy.host = foo/) }
  end
  context 'with aws_client_proxy_port => foo' do
    let(:params) { {:aws_client_proxy_port => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.client.proxy.port = foo/) }
  end
  context 'with aws_client_use_proxy => foo' do
    let(:params) { {:aws_client_use_proxy => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.client.useProxy = foo/) }
  end
  context 'with aws_cloudformation_auto_scale_group_logical_id_author_dispatcher => foo' do
    let(:params) { {:aws_cloudformation_auto_scale_group_logical_id_author_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.autoScaleGroup.logicalId.authorDispatcher = foo/) }
  end
  context 'with aws_cloudformation_auto_scale_group_logical_id_publish => foo' do
    let(:params) { {:aws_cloudformation_auto_scale_group_logical_id_publish => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.autoScaleGroup.logicalId.publish = foo/) }
  end
  context 'with aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher => foo' do
    let(:params) { {:aws_cloudformation_auto_scale_group_logical_id_publish_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.autoScaleGroup.logicalId.publishDispatcher = foo/) }
  end
  context 'with aws_cloudformation_load_balancer_logical_id_author => foo' do
    let(:params) { {:aws_cloudformation_load_balancer_logical_id_author => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.loadBalancer.logicalId.author = foo/) }
  end
  context 'with aws_cloudformation_stack_name_author => foo' do
    let(:params) { {:aws_cloudformation_stack_name_author => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.stackName.author = foo/) }
  end
  context 'with aws_cloudformation_stack_name_author_dispatcher => foo' do
    let(:params) { {:aws_cloudformation_stack_name_author_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.stackName.authorDispatcher = foo/) }
  end
  context 'with aws_cloudformation_stack_name_publish => foo' do
    let(:params) { {:aws_cloudformation_stack_name_publish => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.stackName.publish = foo/) }
  end
  context 'with aws_cloudformation_stack_name_publish_dispatcher => foo' do
    let(:params) { {:aws_cloudformation_stack_name_publish_dispatcher => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.cloudformation.stackName.publishDispatcher = foo/) }
  end
  context 'with aws_sqs_queue_name => foo' do
    let(:params) { {:aws_sqs_queue_name => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^aws.sqs.queueName = foo/) }
  end
  context 'with endpoints_enabled => foo' do
    let(:params) { {:endpoints_enabled => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^endpoints.enabled = foo/) }
  end
  context 'with endpoints_health_enabled => foo' do
    let(:params) { {:endpoints_health_enabled => 'foo', :path => '/tmp/foo', } }
    it { is_expected.to contain_file('/tmp/foo').with_content(/^endpoints.health.enabled = foo/) }
  end
end