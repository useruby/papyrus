module Papyrus
  class Document
    module Metadata
      METADATA = [:date, :title, :author, :tags]
      
      attr_reader *(METADATA + [:body] - [:date])

      def metadata params
        METADATA.each do |param_name|
          instance_variable_set "@#{param_name}", params[param_name]
        end
      end

      def cutting
        @cutted_body = @haml_buffer.buffer.clone unless (@haml_buffer.nil? or @haml_buffer.buffer.nil?)
      end

      def cutted_body
        @cutted_body || @body
      end

      def date
        Date.parse @date
      end

      def date_integer
        Time.utc(date.year, date.month, date.day, 0, 0, 0).to_i
      end

      def method_missing name
        if name.to_s =~ /^cutting[_]*$/
          cutting
        else
          raise NoMethodError, "method: #{name}"
        end
      end
    end
  end
end
