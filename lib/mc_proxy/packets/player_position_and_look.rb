require 'mc_proxy/packets/base'

module McProxy::Packets
  class PlayerPositionAndLook < Base
    attr_reader :x
    attr_reader :y
    attr_reader :z
    attr_reader :stance
    attr_reader :yaw
    attr_reader :pitch
    attr_reader :ground

    schema do
      double :x
      if to_server?
        double :stance
        double :y
      else
        double :y
        double :stance
      end
      double :z
      float :yaw
      float :pitch
      byte :ground
    end

    def to_s
      puts "Player at #@x, #@z, #@x looking #@yaw x #@pitch"
    end
  end
end