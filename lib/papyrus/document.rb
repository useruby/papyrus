require 'papyrus/document/metadata'
require 'papyrus/document/export'

module Papyrus
  class Document
    include Papyrus::Document::Metadata
    include Papyrus::Document::Export

    attr_accessor :filename
    
    def initialize params = {}
      @filename = params[:filename]
    end

    def id
      File.basename filename, '.html.haml'
    end

    def render
      haml_engine = Haml::Engine.new template
      @body = haml_engine.render(self)
    end

    private
    def template
      @template ||= File.read filename
    end
  end
end


