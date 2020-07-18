# frozen_string_literal: true

require 'erb'

module Configs
  # Receives settings in form of a binding, and runs an erb template on the
  # binding. It writes the results into a predefined location.
  class ConfigFile
    # New config file
    # @param template [String] template file location
    # @param location [String] where to write resulting config
    # @param binding [Binding] bindings for erb template
    def initialize(template, location, binding)
      @template = template
      @location = location
      @binding = binding
    end

    def call
      File.write(@location, content)
    end

    private

    def content
      erb_template.result(@binding)
    end

    def erb_template
      ERB.new(File.read(@template))
    end
  end
end
