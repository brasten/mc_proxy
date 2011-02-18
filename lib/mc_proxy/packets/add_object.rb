require 'mc_proxy/packets/base'

module McProxy::Packets
  class AddObject < Base
    attr_reader :entity_id
    attr_reader :type
    attr_reader :x
    attr_reader :y
    attr_reader :z

    schema do
      byte :packet_id
      int :entity_id
      byte :type
      int :x
      int :y
      int :z
    end

    def to_s
      "<AddObject entity_id=#{self.entity_id} type=#{self.type} x=#{@x} y=#{self.y} z=#{self.z}"
    end
  end
end