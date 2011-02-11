require 'mc_proxy/parser'

module McProxy
  module Fields

    # Handles parsing a variable-length string from a binary string
    #
    # Picks up a short from the first two bytes and uses it as the expected string
    # length.
    #
    class VariableString < String
      
      class << self

        # Parse from data, using offset if provided
        #
        def parse(data, offset=0)
          expected_length = nil
         # puts "VariableString.parse"
         # puts "Data --> #{data.inspect}"

          Parser.new(data.bytes.to_a, offset).parse(nil) { |p| expected_length = parse_short_field }
          # puts "Expected_length: #{expected_length}"
          raise NotEnoughDataError if (data.bytesize < (expected_length + 2))
#          puts "Exp. Len: #{expected_length}"

          new(data.bytes.to_a[(offset+2)...(offset+2+expected_length)].pack('c*'))
        end
      end

      # Total bytes of the string + 2 extra (length field)
      #
      def bytes_consumed
        self.bytesize + 2
      end

    end
  end
end