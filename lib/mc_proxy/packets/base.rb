require 'mc_proxy/parser'

module McProxy::Packets
  class Base
    
    attr_reader :packet_id
    attr_reader :destination
    attr_reader :raw
    
    class << self
      def parse(data, destination)
        if !self.schema_definition.nil?
          p = McProxy::Parser.new(data)
          p.parse(destination, &self.schema_definition)
        
          create(destination, p.parsed_raw, p.fields)
        else
          # puts "No Definition for: #{self.inspect}"
          raise ::McProxy::NotEnoughDataError unless data.size >= self::SIZE
          
          create(destination, data[0...self::SIZE])
        end
      end

      def create(destination, raw, fields={})
        new(destination, raw, fields)
      end

      def schema(&block)
        @schema_definition = block
      end

      def schema_definition
        @schema_definition
      end
    end
    
    def initialize(destination, raw, fields={})
      @destination = destination
      @raw = raw.kind_of?(Array) ? raw.pack('c*') : raw
      
      fields.each_pair do |key, val|
        instance_variable_set(:"@#{key.to_s}", val)
      end
    end

    def type
      self.class.name
    end

    # def packet_id
    #   @raw.bytes.to_a[0].to_s
    # end
    
    def bytesize
      @raw.bytesize
    end

    def destination_marker
      (self.destination.to_sym == :server) ? 'S' : 'C'
    end
  
    def to_s
      "<#{self.type} raw=#{self.raw.inspect}>"
    end
  
  end
end