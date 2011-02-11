require 'mc_proxy/packets/base'

module McProxy::Packets
  class WindowClick < Base
    
    schema do
      byte :window_id
      short :slot
      byte :right_click
      short :action_number
      short :item_id
      
      if field(:item_id) != -1
        byte :item_count
        short :item_uses
      end
    end

  end
end