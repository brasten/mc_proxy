require 'mc_proxy/parser'

module McProxy::Packets
  class ChatMessage < Base
    PACKET_ID = 3
    
    attr_reader :message
    
    schema do
      byte :packet_id
      text :message
    end
  
    def to_s
      "<ChatMessage message=\"#{self.message}\">" +
      "  +--> RAW: #{self.raw.inspect}"
      
    end
    
  end
end