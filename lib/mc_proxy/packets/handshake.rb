require 'bit-struct'
require 'mc_proxy/packets/base'

module McProxy::Packets
  class Handshake < Base
    
    attr_reader :header
    
    class << self
      def parse(data, destination)
        if destination.to_sym == :server
          header = ToServerHeader.new(data)

          if data.bytesize >= (header.payload_length + 3)
            raw = data.bytes.to_a[0...(header.payload_length+3)].pack("c*")
            new(destination, raw, :header => header)
          else
            nil
          end
          
        else
          header = ToClientHeader.new(data)
          
          raw = data.bytes.to_a[0..1].pack("c*")
          new(destination, raw, :header => header)
        end
      end
    end
    
    def username
      @username ||= self.raw.unpack("xxxa#{self.header.payload_length}").first
    end
    
    def to_s
      super
      if self.destination.to_sym == :server
        puts "Username: #{self.username}"
      end
    end
    
    class ToServerHeader < BitStruct
      char :packet_type, 8
      signed :payload_length, 16
    end

    class ToClientHeader < BitStruct
      char :packet_type, 8
    end
  end
end