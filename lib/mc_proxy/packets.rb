module McProxy
  module Packets

    autoload :Login, 'mc_proxy/packets/login'
    autoload :KeepAlive, 'mc_proxy/packets/keep_alive'
    autoload :Handshake, 'mc_proxy/packets/handshake'
    autoload :MobSpawn, 'mc_proxy/packets/mob_spawn'
    autoload :Prechunk, 'mc_proxy/packets/prechunk'
    autoload :PlayerPositionAndLook, 'mc_proxy/packets/player_position_and_look'
    autoload :PlayerPosition, 'mc_proxy/packets/player_position'
    autoload :DestroyEntity, 'mc_proxy/packets/destroy_entity'
    
    class << self
      def parse(data, destination)
        return nil if (data.bytesize == 0)
        klass = class_for(data.bytes.to_a.first.to_s)

        klass.parse(data, destination)
      end
      
      def class_for(packet_id)
        case packet_id.to_i
        when 0
          KeepAlive
        when 1
          Login
        when 2
          Handshake
        when 50 # 0x32
          Prechunk
        when 24 # 0x18
          MobSpawn
        when 13 # 0x0D
          PlayerPositionAndLook
        when 11 # 0x0B
          PlayerPosition
        when 29 # 01D
          DestroyEntity
        else
          Base
        end          
      end
      
    end
    
  end
end