# frozen_string_literal: true

module Configs
  # Receives settings in form of a binding, and runs an erb template on the
  # binding. It writes the results into a predefined location.
  class ConfigFile
    # New config file
    # @param template [String] template file location
    # @param location [String] where to write resulting config
    # @param binding [Binding] bindings for erb template
    def initialize(template, location)
      @template = template
      @location = location
      @binding = binding
    end
  end
end
