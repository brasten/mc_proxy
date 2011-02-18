require 'mc_proxy/packets/base'

module McProxy::Packets
  class EntityPainting < Base

    schema do
      byte :packet_id
      int :entity_id
      text :title
      int :x
      int :y
      int :z
      int :type
    end

  end
end