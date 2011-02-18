require 'mc_proxy/packets/base'

module McProxy::Packets
  class PlayerPosition < Base
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :stance
    attr_reader :ground

    schema do
      byte :packet_id
      double :x
      double :y
      double :stance
      double :z
      byte :ground
    end

    def to_s
      "Player at #@x, #@z, #@x"
    end
  end
end