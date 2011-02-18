require 'bit-struct'

module McProxy
  module Fields
    autoload :VariableString, 'mc_proxy/fields/variable_string'
    autoload :DataStream, 'mc_proxy/fields/data_stream'
  end

  class ParseError < StandardError; end
    class NotEnoughDataError < ParseError; end

  # Allows for relatively easy parsing of byte strings
  #
  class Parser

    attr_reader :fields
    attr_reader :offset

    # Returns a Parser
    #
    # @param [String] data
    # @param [Number] offset (optional)
    #
    def initialize(data, offset=0)
      @data = data.kind_of?(String) ? data.bytes.to_a : data
      @original_offset = @offset = offset
      @raw = []
      @fields = {}
    end

    def parse(destination, &definition)
      @definition= definition
      @destination = destination
      @fields = {}
      # @fields[:packet_id] = parse_byte_field  # throw array packet_id
      instance_eval(&definition)
    end

    [:byte, :text, :stream, :short, :int, :long, :float, :double].each do |meth|
      define_method(meth) do |field_name|
        val = send(:"parse_#{meth}_field")
        @fields[field_name] = val
      end
    end

    def records(name, &block)
      arr   = []
      count = parse_int_field

      count.times do
        p = Parser.new(@data, @offset)
        p.parse(@destination, &block)
        arr << p.fields
        @offset = p.offset
      end
      
      fields[name] = arr
    end

    def field(name)
      @fields[name.to_sym]
    end

    def to_server?
      @destination == :server
    end

    def to_client?
      @destination == :client
    end

    def parse_byte_field
      val = @data[@offset]
      @offset += 1
      val
    end

    def parse_text_field
      ensure_size!(2)

      val = Fields::VariableString.parse(@data.pack('c*'), @offset)
      @offset += val.bytes_consumed
      val
    end

    def parse_stream_field
      val = Fields::DataStream.parse(@data[@offset..-1])
      @offset += val.bytes_consumed
      val
    end

    def parse_short_field
      ensure_size!(2)

      offset_data = @data[@offset..-1].pack('c*')
      val = SignedShort.new(offset_data).value
      @offset += 2
      val
    end

    def parse_int_field
      ensure_size!(4)

      offset_data = @data[@offset..-1].pack('c*')
      val = SignedInt.new(offset_data).value
      @offset += 4
      val
    end

    def parse_long_field
      ensure_size!(8)

      offset_data = @data[@offset..-1].pack('c*')
      val = SignedLong.new(offset_data).value
      @offset += 8
      val
    end

    def parse_float_field
      ensure_size!(4)

      offset_data = @data[@offset..-1].pack('c*')
      val = FloatStruct.new(offset_data).value
      @offset += 4
      val
    end

    def parse_double_field
      ensure_size!(8)

      offset_data = @data[@offset..-1].pack('c*')
      val = DoubleStruct.new(offset_data).value
      @offset += 8
      val
    end

    def parsed_raw
      @data[@original_offset...@offset].pack('c*')
    end

    private

    def ensure_size!(size)
      raise NotEnoughDataError if (@data.size < (size + @offset))
    end

    class SignedShort < BitStruct
      signed :value, 16
    end
    
    class SignedInt < BitStruct
      signed :value, 32
    end

    class SignedLong < BitStruct
      signed :value, 64
    end

    class FloatStruct < BitStruct
      float :value, 32
    end

    class DoubleStruct < BitStruct
      float :value, 64
    end

  end
end