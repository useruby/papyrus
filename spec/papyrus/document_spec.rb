require 'spec_helper'

describe Papyrus::Document do
  describe 'Test Document' do
    before :all do
      @test_document = Papyrus::Document.new :filename => 'spec/samples/documents/test/01.html.haml'
      @test_document.render
    end

    it 'should has date 05/30/2011' do
      @test_document.date.should == Date.parse('05/30/2011')
    end

    it 'should has title Test Document 01' do
      @test_document.title.should == 'Test Document 01'
    end

    it 'should has author Alexey Artamonov' do
      @test_document.author.should == 'Alexey Artamonov'
    end

    it 'should has two tags: category1 and category2' do
      @test_document.tags.size.should == 2
      @test_document.tags.first.should == 'category1'
      @test_document.tags.last.should == 'category2'
    end

    it 'should has cutted body less than full body' do
      @test_document.cutted_body.size.should < @test_document.body.size
    end

    it 'should has not empty body' do
      @test_document.body.should_not be_empty
    end

    it 'should export article data for sphinx search index' do
      @test_document.to_sphinx_xml.should_not be_empty
    end

    it 'should has an id 01' do
      @test_document.id.should == '01'
    end
  end

  describe 'Test Document 02' do
    before :all do
      @test_document = Papyrus::Document.new :filename => 'spec/samples/documents/test/02.html.haml'
      @test_document.render
    end

    it 'should has date 05/29/2011' do
      @test_document.date.should == Date.parse('05/29/2011')
    end

    it 'should has title Test Document 02' do
      @test_document.title.should == 'Test Document 02'
    end

    it 'should has author Alexey Artamonov' do
      @test_document.author.should == 'Alexey Artamonov'
    end

    it 'should has two tags: category1' do
      @test_document.tags.size.should == 1
      @test_document.tags.first.should == 'category1'
    end

    it 'should has body same as cutted body' do
      @test_document.body.should == @test_document.cutted_body
    end

    it 'should has not empty body' do
      @test_document.body.should_not be_empty
    end
  end

  describe '#cutting_____________________' do
    it 'should exec cutting method' do
      lambda {Papyrus::Document.new.cutting_____________________}.should_not raise_error(NoMethodError)
    end
  end
end
 
