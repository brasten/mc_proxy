require 'mc_proxy/packets/base'

module McProxy::Packets
  class UpdateSign < Base
    
    schema do
      byte :packet_id
      int :x
      short :y
      int :z
      text :line_one
      text :line_two
      text :line_three
      text :line_four
    end

  end
end