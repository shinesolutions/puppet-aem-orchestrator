# frozen_string_literal: true

require 'json'

module JSON
  class << self
    alias _legacy_parse parse unless method_defined?(:_legacy_parse)

    def parse(source, proc_or_opts = nil, opts = nil)
      if proc_or_opts.is_a?(Hash)
        _legacy_parse(source, **proc_or_opts)
      elsif opts.is_a?(Hash)
        _legacy_parse(source, proc_or_opts, **opts)
      elsif proc_or_opts.nil? && opts.nil?
        _legacy_parse(source)
      else
        _legacy_parse(source, proc_or_opts, opts)
      end
    end

    attr_writer :create_id

    def create_id
      @create_id ||= 'json_class'
    end
  end

  # Pre-set flag before json-schema loads to prevent load-time deprecation warning
  class Validator
    @use_multi_json = false
  end
end

begin
  require 'json-schema'
rescue LoadError
  # Gem not loaded in this environment
end
