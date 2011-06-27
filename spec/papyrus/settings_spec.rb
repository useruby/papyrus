require 'spec_helper'

describe Papyrus::Settings do
  describe '#documents_root' do
    it 'should return documents root folder name' do
      Papyrus::Settings.documents_root.should == "#{File.dirname(__FILE__).split('/')[0...-1].join('/')}/samples/documents"
    end
  end
end
 
