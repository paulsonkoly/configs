# frozen_string_literal: true

require 'erb'

module Configs
  # Receives settings in form of a binding, and runs an erb template on the
  # binding. It writes the results into a predefined location.
  class ConfigFile
    # New config file
    # @param template [String] template file location
    # @param location [String] where to write resulting config
    # @param bindings [Hash] bindings for erb template
    def initialize(template, location, binding_hash)
      @template = template
      @location = location
      @binding_hash = binding_hash
    end

    attr_reader :template, :location, :binding_hash

    # wrapper for new with yaml data
    def self.from_yaml(yml_data)
      new(yml_data['template'], yml_data['output'], yml_data['binding'])
    end

    def call
      File.write(@location, content)
    end

    private

    def content
      erb_template.result(binding_from_hash)
    end

    def erb_template
      ERB.new(File.read(@template))
    end

    def binding_from_hash
      hash = @binding_hash
      Object.new.instance_eval do
        hash.each_pair do |key, value|
          instance_variable_set("@#{key}", value)
        end
        self.binding
      end
    end
  end
end
