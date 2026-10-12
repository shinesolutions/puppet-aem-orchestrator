# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'aem_orchestrator class' do
  context 'with default parameters' do
    it 'works idempotently with no errors' do
      pp = <<-MANIFEST
        include aem_orchestrator
      MANIFEST

      idempotent_apply(pp)
    end
  end
end
