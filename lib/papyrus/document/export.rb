module Papyrus
  class Document
    module Export
      def self.included base
        base.send :include, CRC32 
      end

      def strip_tags text
        text.gsub(/<.+?>/, '')
      end

      def to_sphinx_xml
        xml = %Q{<sphinx:document id="#{crc32 filename}">\n}
        xml << "<title>#{title}</title>\n"
        xml << "<body>#{strip_tags body}</body>\n"
        xml << "<author>#{author}</author>\n"
        
        xml << "<tags>\n"
        tags.each do |tag|  
          xml <<  %Q{<attr>#{crc32 tag}</attr>} << "\n"
        end
        xml << "</tags>\n"
        
        xml << "<date>#{date_integer}</date>\n"
        xml << "</sphinx:document>\n"
      end
    end
  end
end
