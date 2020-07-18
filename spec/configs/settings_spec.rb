# frozen_string_literal: true

require 'spec_helper'

require 'tmpdir'

require 'configs/settings'

RSpec.describe Configs::Settings do
  let(:fake_yaml) do
    <<~END_OF_FAKE_YAML
      ---
      fake program config:
        binding:
          some_variable: value
          other_variable: true
          colour_variable: "#993322"
        template: some_template
        output: some_output
    END_OF_FAKE_YAML
  end

  let(:tmpdir) { Dir.mktmpdir }

  let(:yamlfile) { File.join(tmpdir, 'fake.yml') }

  before { File.write(yamlfile, fake_yaml) }

  after { FileUtils.rm_f yamlfile }

  subject { described_class.new(yamlfile) }

  describe '#each' do
    it 'yields the configs' do
      expect { |b| subject.each(&b) }
        .to yield_with_args(an_object_having_attributes(
                              binding_hash: { 'some_variable' => 'value',
                                              'other_variable' => true,
                                              'colour_variable' => '#993322' },
                              template: 'some_template',
                              location: 'some_output'
                            ))
    end
  end
end
