require 'mc_proxy/packets/base'

module McProxy::Packets
  
  # MultiBlockChange
  #
  # Further investigation shows that this is a multiple-block-change command; if you take 
  # the three arrays, and put together elements with the same index, and then decompose 
  # the short into coordinates (top 4 bits is X, next 4 bits is Z, bottom 8 bits is Y), 
  # you get things like [((8, 7, 4), 11, 0), ((7, 13, 6), 11, 0), ((13, 1, 8), 11, 0), 
  # ((7, 6, 6), 11, 0)].
  #
  # See the Block Change command for description of the general format of a block change.
  #
  class MultiBlockChange < Base

    schema do
      byte :packet_id
      int :x
      int :z
      short :array_count

      @offset += field(:array_count) * 4
      
      # field(:array_count).times do |idx|
      #   parse_short_field
      # end
      # field(:array_count).times do |idx|
      #   parse_byte_field
      # end
      # field(:array_count).times do |idx|
      #   parse_byte_field
      # end


    end

    def to_s
      "MultiBlockChange for #{@x}, #{@y} with record count: #{@array_count}"
    end

  end
end