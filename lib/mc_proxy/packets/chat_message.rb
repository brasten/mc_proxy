require 'mc_proxy/parser'

module McProxy::Packets
  class ChatMessage < Base
    PACKET_ID = 3
    
    attr_reader :message
    
    schema do
      text :message
    end
  
    def to_s
      "Chat: #{self.message}"
    end
    
  end
end