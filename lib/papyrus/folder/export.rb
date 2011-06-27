module Papyrus
  class Folder
    module Export
      def to_sphinx_xml
        sphinx_xml = '<?xml version="1.0" encoding="UTF-8"?>' << "\n"
        sphinx_xml << '<sphinx:docset>' << "\n"
        sphinx_xml << '<sphinx:schema>' << "\n"
        sphinx_xml << '<sphinx:field name="title"/>' << "\n"
        sphinx_xml << '<sphinx:field name="body"/>' << "\n"
        sphinx_xml << '<sphinx:field name="author"/>' << "\n"
        sphinx_xml << '<sphinx:attr name="tags" type="multi"/>' << "\n"
        sphinx_xml << '<sphinx:attr name="date" type="timestamp"/>' << "\n"
        sphinx_xml << '</sphinx:schema>' << "\n" 

        documents.each do |document|
          sphinx_xml << document.to_sphinx_xml
        end

        sphinx_xml << '</sphinx:docset>'
      end
    end
  end
end
 
