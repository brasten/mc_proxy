module McProxy::Packets
  class Base
    
    attr_reader :destination
    attr_reader :raw
    
    class << self
      def parse(data, destination)
        new(destination, data)
      end
    end
    
    def initialize(destination, raw, fields={})
      @destination = destination
      @raw = raw
      
      fields.each_pair do |key, val|
        instance_variable_set(:"@#{key.to_s}", val)
      end
    end

    def type
      self.class.name
    end

    def packet_id
      @raw.bytes.to_a[0].to_s
    end
    
    def bytesize
      @raw.bytesize
    end
  
    def to_s
      puts "To     : #{self.destination.to_s}"
      puts "Type   : #{self.type}"
      puts "Type ID: #{self.packet_id}"
      puts "RAW    : #{self.raw.inspect}"
    end
  
  end
end