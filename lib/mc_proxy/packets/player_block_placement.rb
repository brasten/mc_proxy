require 'mc_proxy/packets/base'

module McProxy::Packets
  class PlayerBlockPlacement < Base
    PACKET_ID = 15

    schema do
      int :x
      byte :y
      int :z
      byte :direction
      short :block_or_item_id

      if field(:block_or_item_id) >= 0
        byte :amount
        short :damage
      end
    end

  end
end