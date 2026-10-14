# frozen_string_literal: true

require 'spec_helper_acceptance'

# Applied once rather than checked for idempotency: without AWS configuration the
# orchestrator exits shortly after starting, so a second run would restart it.
describe 'aem_orchestrator class' do
  context 'with default parameters' do
    it 'applies with no errors' do
      apply_manifest('include aem_orchestrator', catch_failures: true)
    end

    describe user('aem-orchestrator') do
      it { is_expected.to exist }
      it { is_expected.to belong_to_primary_group 'aem-orchestrator' }
    end

    describe file('/opt/shinesolutions/aem-orchestrator/aem-orchestrator.jar') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'aem-orchestrator' }
      it { is_expected.to be_mode 500 }
    end

    describe file('/opt/shinesolutions/aem-orchestrator/application.properties') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'aem-orchestrator' }
      it { is_expected.to be_mode 400 }
    end

    describe file('/etc/systemd/system/aem-orchestrator.service') do
      it { is_expected.to be_file }
    end

    describe service('aem-orchestrator') do
      it { is_expected.to be_enabled }
    end
  end
end
