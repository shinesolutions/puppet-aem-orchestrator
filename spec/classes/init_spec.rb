require 'spec_helper'
describe 'aem_orchestrator' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('aem_orchestrator') }
    it { is_expected.to contain_file('/opt/shinesolutions') }
    it { is_expected.to contain_file('/opt/shinesolutions/lib') }
    it { is_expected.to contain_file('/opt/shinesolutions/bin') }
    it { is_expected.to contain_file('/opt/shinesolutions/lib/aem-orchestrator.jar') }
  end
end
