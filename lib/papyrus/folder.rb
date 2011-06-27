require 'papyrus/folder/sphinx'
require 'papyrus/folder/index'
require 'papyrus/folder/export'

module Papyrus
  class Folder
    include Sphinx
    include Export

    DOCUMENTS_PER_PAGE = 10

    attr_reader :index, :name

    def initialize name
      @name = name
      @index = Papyrus::Folder::Index.new name
    end

    def documents
      Dir.glob("#{path}/*.haml").sort.map do |document_filename|
        document = Papyrus::Document.new :filename =>  document_filename
        document.render
        document
      end
    end

    def find_all
      query
    end

    def find opts
      query opts
    end

    def self.all
      dirs = Dir.foreach(Papyrus::Settings.documents_root).select do |dir| 
        File.directory?("#{Papyrus::Settings.documents_root}/#{dir}") and !['.', '..'].include?(dir)
      end

      dirs.map do |dir|
        Folder.new dir
      end
    end

    private
    def path
      "#{Papyrus::Settings.documents_root}/#{name}"
    end
  end
end
