require 'mc_proxy/packets/base'

module McProxy::Packets
  class EntityLook < Base
    attr_reader :entity_id
    attr_reader :yaw
    attr_reader :pitch

    schema do
      byte :packet_id
      int :entity_id
      byte :yaw
      byte :pitch
    end

    def to_s
      "<EntityLook entity_id=#{self.entity_id} yaw=#{self.yaw} pitch=#{self.pitch}>"
    end
  end
end