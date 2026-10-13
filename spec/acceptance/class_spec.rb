# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'aem_orchestrator class' do
  context 'with default parameters' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) { 'include aem_orchestrator' }
    end
  end
end
