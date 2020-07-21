# frozen_string_literal: true

require_relative 'lib/configs/version'

Gem::Specification.new do |spec|
  spec.name          = 'configs'
  spec.version       = Configs::VERSION
  spec.authors       = ['Paul Sonkoly']
  spec.email         = ['sonkoly.pal@gmail.com']

  spec.summary       = 'Small application that generates many config files from a single source'
  spec.description   = <<~END_OF_DESC
    Replace pywal to have control over the colourscheme colours or whatever
    else common config you have, like font.
  END_OF_DESC
  spec.homepage      = 'http://github.com/phaul/configs'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://github.com/phaul/configs'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = 'configs'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'xdg', '~> 4.1'
end
