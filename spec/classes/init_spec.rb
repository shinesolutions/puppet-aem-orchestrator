require 'spec_helper'
describe 'aem_orchestrator' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('aem_orchestrator') }
    it { is_expected.to contain_class('aem_orchestrator::application_properties') }
    it { is_expected.to contain_file('/opt/shinesolutions') }
    it { is_expected.to contain_archive('/opt/shinesolutions/aem-orchestrator/aem-orchestrator.jar') }
    it { is_expected.to contain_file('/opt/shinesolutions/aem-orchestrator/aem-orchestrator.jar') }
    it { is_expected.to contain_file('/etc/systemd/system/aem-orchestrator.service') }
    it { is_expected.to contain_file('/opt/shinesolutions/aem-orchestrator/application.properties') }
    it { is_expected.to contain_user('aem-orchestrator') }
    it { is_expected.to contain_group('aem-orchestrator') }
    it { is_expected.to contain_service('aem-orchestrator') }
  end
end
