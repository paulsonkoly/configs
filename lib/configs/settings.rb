# frozen_string_literal: true

require 'yaml'

require 'configs/config_file'

module Configs
  # Store of global yml
  class Settings
    # New settings store
    # @param yamlfile [String] Location of global yaml
    def initialize(yamlfile)
      @yamlfile = yamlfile
    end

    def each
      loaded_yaml.each_value do |yml_data|
        yield(ConfigFile.from_yaml(yml_data))
      end
    end

    private

    def loaded_yaml
      YAML.safe_load(File.read(@yamlfile))
    end
  end
end
