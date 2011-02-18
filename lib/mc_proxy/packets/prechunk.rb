require 'mc_proxy/packets/base'

module McProxy::Packets
  class Prechunk < Base
    attr_reader :x
    attr_reader :z
    attr_reader :mode

    schema do
      byte :packet_id
      int :x
      int :z
      byte :mode
    end

    def to_s
      "<Prechunk mode=#{@mode ? 'Initializing' : 'Clearing'} x=#{@x}, z=#{@z}>\n  +-- size: #{self.bytesize}"
    end
  end
end