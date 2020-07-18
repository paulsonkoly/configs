# frozen_string_literal: true

require 'spec_helper'

require 'configs/config_file'
require 'tmpdir'

RSpec.describe Configs::ConfigFile do
  let(:fake_binding) { { fake_setting: 'value' } }

  let(:tmpdir) { Dir.mktmpdir }

  let(:fake_template) do
    File.join(tmpdir, 'fake_config.erb')
  end

  let(:fake_output_location) do
    File.join(tmpdir, 'fake_config')
  end

  before :each do
    File.write(fake_template, <<~END_OF_TEMPLATE)
      Fake config file
      ================
      # containing only a single setting whose value is 'value'
      fake_setting = <%= @fake_setting %>
    END_OF_TEMPLATE
  end

  after :each do
    FileUtils.rm_f(fake_template)
  end

  describe '#call' do
    subject { described_class.new(fake_template, fake_output_location, fake_binding) }

    it 'writes the expected config file' do
      expect { subject.call }.to change { File.exist?(fake_output_location) }.from(false).to(true)
    end

    it 'writes a config file with the expected content' do
      subject.call
      content = File.read(fake_output_location)
      expect(content).to eq <<~EXPECTED_OUTPUT_END
        Fake config file
        ================
        # containing only a single setting whose value is 'value'
        fake_setting = value
      EXPECTED_OUTPUT_END
    end
  end
end
