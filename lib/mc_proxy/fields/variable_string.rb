require 'bit-struct' 
module McProxy
  module Fields
    class VariableString < String
      
      class << self
        def parse(data, offset=0)
          expected_length = SignedShort.new(data.bytes.to_a[offset..(offset+2)].pack('c*'))
          new(data.bytes.to_a[(offset+2)...(offset+2+expected_length.value)].pack('c*'))
        end
      end


      class SignedShort < BitStruct
        signed :value, 16
      end
      
    end
  end
end