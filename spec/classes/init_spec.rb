require 'spec_helper'
describe 'aem_orchestrator' do

  context 'with defaults for all parameters' do
    it { should contain_class('aem_orchestrator') }
    it { should contain_file('/opt/shinesolutions') }
    it { should contain_file('/opt/shinesolutions/lib') }
    it { should contain_file('/opt/shinesolutions/bin') }
    it { should contain_file('/opt/shinesolutions/lib/aem-orchestrator.jar') }
  end
end
