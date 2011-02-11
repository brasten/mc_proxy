require 'mc_proxy/parser'

module McProxy
  module Fields

    # Handles parsing a Data Stream from a binary string
    #
    class DataStream < String

      class << self

        # Parse from data, using offset if provided
        #
        def parse(data, offset=0)
          raise NotEnoughDataError if data.empty?
          
          collected = []

          data[offset..-1].each do |byte|
            if byte == 247
              return new(collected.pack('c*'))
            else
              collected << byte
            end
          end

          raise NotEnoughDataError
        end
      end

      # Total bytes of the string + 2 extra (length field)
      #
      def bytes_consumed
        self.bytesize + 1
      end

    end
  end
end