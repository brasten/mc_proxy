require 'mc_proxy/packets/base'

module McProxy::Packets
  class MapChunk < Base

    schema do
      int   :x
      short :y
      int   :z
      byte  :size_x
      byte  :size_y
      byte  :size_z
      int   :chunk_size
      
      puts "Chunk SIZE == #{field(:chunk_size)}"

      @offset += field(:chunk_size)
      # field(:chunk_size).times do |idx|
      #   
      #   parse_byte_field
      # end
      
    end
    
  end
end