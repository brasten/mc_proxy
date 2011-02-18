require 'mc_proxy/packets/base'

module McProxy::Packets
  class Entity < Base

    attr_reader :entity_id

    schema do
      byte :packet_id
      int :entity_id
    end

  end
end