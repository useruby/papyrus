module Papyrus
  class Folder
    module Sphinx
      include CRC32
      DOCUMENTS_PER_PAGE = 10

      private
      def query opts = {}
        client = Riddle::Client.new 'localhost', Papyrus::Settings.searchd_port
        
        opts[:query] ||= ''
        opts[:page] ||= 1

        client.match_mode = :fullscan if opts[:query].empty?
        client.sort_mode = :extended
        client.sort_by = 'date DESC'
        
        if opts[:author]
          client.match_mode = :extended
          opts[:query] += " @author #{opts[:author]}"
        end

        client.offset = (opts[:page] - 1)*Papyrus::Folder::Sphinx::DOCUMENTS_PER_PAGE
        client.limit = Papyrus::Folder::Sphinx::DOCUMENTS_PER_PAGE

        if opts[:tag]
          client.filters << Riddle::Client::Filter.new('tags', [crc32(opts[:tag])], false)
        end

        search_result = client.query opts[:query], self.index.name
        parse_search_result search_result
      end

      def parse_search_result result
        connect_search_result_with_documents result[:matches]
      end

      def connect_search_result_with_documents result
        crc32_filename = init_crc32_filename_hash

        result.map do |item|
          filename = crc32_filename[item[:doc]]
          document = Papyrus::Document.new :filename => filename
          document.render
          document
        end
      end

      def init_crc32_filename_hash
        Dir["#{path}/*.haml"].inject({}) do |hash, filename|
          hash[crc32(filename)] = filename; hash
        end
      end
    end
  end
end

