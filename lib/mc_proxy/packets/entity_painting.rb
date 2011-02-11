require 'mc_proxy/packets/base'

module McProxy::Packets
  class EntityPainting < Base

    schema do
      int :entity_id
      text :title
      int :x
      int :y
      int :z
      int :type
    end

  end
end