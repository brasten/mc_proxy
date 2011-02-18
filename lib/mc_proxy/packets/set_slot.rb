require 'mc_proxy/packets/base'

module McProxy::Packets
  class SetSlot < Base

    schema do
      byte :packet_id
      byte :window_id
      short :slot
      short :item_id
      
      if field(:item_id) != -1
        byte :item_count
        short :item_uses
      end
    end

  end
end