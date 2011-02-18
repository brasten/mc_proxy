require 'mc_proxy/packets/base'

module McProxy::Packets
  class OpenWindow < Base

    schema do
      byte :packet_id
      byte :window_id
      byte :inventory_type
      text :title
      byte :number_of_slots
    end
    
  end
end