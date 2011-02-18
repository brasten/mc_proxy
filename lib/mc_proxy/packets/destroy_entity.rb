require 'mc_proxy/packets/base'

module McProxy::Packets
  class DestroyEntity < Base
    attr_reader :entity_id

    schema do
      byte :packet_id
      int :entity_id
    end

    def to_s
      "<DestroyEntity entity_id=#{self.entity_id}>"
    end
    
  end
end