require 'mc_proxy/packets/base'

module McProxy::Packets
  class WindowItems < Base
    
    schema do
      puts "WindowItems --"
      puts "  --> DATA: #{@data}"
      byte :window_id
      short :item_count

      puts "Window ID: #{field(:window_id)}"
      puts "Item Count: #{field(:item_count)}"
      
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