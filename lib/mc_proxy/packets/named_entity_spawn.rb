require 'mc_proxy/packets/base'

module McProxy::Packets
  class NamedEntitySpawn < Base

    schema do
      byte :packet_id
      int :entity_id
      text :player_name
      int :x
      int :y
      int :z
      byte :rotation
      byte :pitch
      short :current_item
    end

  end
end