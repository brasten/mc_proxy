require 'mc_proxy/packets/base'

module McProxy::Packets
  class WindowItems < Base
    
    schema do
      byte :packet_id
      byte :window_id
      short :item_count

      
      field(:item_count).times do
        item_id = parse_short_field()
        if item_id != -1
          parse_byte_field()
          parse_short_field()
        end
      end
      
    end
    
  end
end