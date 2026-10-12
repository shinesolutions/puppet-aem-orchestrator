# frozen_string_literal: true

require 'spec_helper'
require 'facter'

describe 'aem_orchestrator' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }
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
  end
end
