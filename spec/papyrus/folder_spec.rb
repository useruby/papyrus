require 'spec_helper'

describe Papyrus::Folder do
  describe 'test' do
    before :all do
      @folder = Papyrus::Folder.new('test')
    end

    describe '#documents' do
      it 'should return all documents from folder' do
        documents = @folder.documents
        documents.should_not be_empty
      end

      it 'should have first document with title Test Document 01 in the returned list' do
        @folder.documents.first.title.should == 'Test Document 01'
      end
    end

    describe 'document' do
      it 'should return document from folder by id' do
        document = @folder.document '01'
        document.should_not be_nil
        document.title.should == 'Test Document 01'
      end
    end

    describe '#find_all' do
      it 'should return all documents from folder' do
        documents = @folder.find_all
        documents.should_not be_empty
        documents.first.should be_kind_of Papyrus::Document
      end
    end

    describe '#find' do
      it 'should return documents tagged as category1' do
        documents = @folder.find :tag => 'category1'
        documents.each do |document|
          document.tags.should be_include 'category1'
        end
      end

      it 'should return documents tagged as category2' do
        documents = @folder.find :tag => 'category2'
        documents.each do |document|
          document.tags.should be_include 'category2'
        end
      end

      it 'should return empty result when selected tag category3' do
        @folder.find(:tag => 'category3').should be_empty
      end

      it 'should return document contained a Neque molestie maecenas' do
        @folder.find(:query => 'Neque molestie maecenas').should_not be_empty
      end

      it 'should return empty result for query Cthulhu' do
        @folder.find(:query => 'Cthulhu').should be_empty
      end

      it 'should return Alexey Artamonov\'s documents' do
        documents = @folder.find(:author => 'Alexey Artamonov')
        documents.should_not be_empty
        documents.each do |document|
          document.author.should == 'Alexey Artamonov'
        end
      end

      it 'should return empty result for author Constantine Kipnis' do
        @folder.find(:author => 'Constantine Kipnis').should be_empty
      end
    end

    describe '#to_sphinx_xml' do
      it 'should export documents from folder to xml format suitable for sphinx' do
        @folder.to_sphinx_xml.should_not be_empty
      end
    end
  end

  describe '#all' do
    it 'should return list of folders for indexing' do
      Papyrus::Folder.all.count.should > 0
    end

    it 'should include test folder in list of folder for indexing' do
      Papyrus::Folder.all.find{|folder| folder.name == ('test')}.should_not be_nil
    end
  end
end
 
