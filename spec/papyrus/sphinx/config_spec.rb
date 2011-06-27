require 'spec_helper'

describe Papyrus::Sphinx::Config do
  describe '#generate' do
    it 'should generate config file for sphinx' do
      File.delete Papyrus::Settings.sphinx_conf if File.exist? Papyrus::Settings.sphinx_conf

      Papyrus::Sphinx::Config.generate

      File.should be_exist Papyrus::Settings.sphinx_conf
    end
  end
end
 
