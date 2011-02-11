require 'mc_proxy/packets/base'

module McProxy::Packets
  class MobSpawn < Base
    attr_reader :entity_id
    attr_reader :mob_type
    attr_reader :x, :y, :z
    attr_reader :yaw
    attr_reader :pitch
    attr_reader :metadata

    schema do
      int :entity_id
      byte :mob_type
      int :x
      int :y
      int :z
      byte :yaw
      byte :pitch
      stream :metadata
    end

    def to_s
      puts "Spawning a #{@mob_type} mob at #{@x}, #{@y}, #{@z}..."
    end

  end
end

#0x18	 EID	 int	446	 Entity ID
#Type	 byte	91	 The type of Mob Entity Type
#X	 int	13366	 The Absolute Integer X Position of the object
#Y	 int	2176	 The Absolute Integer Y Position of the object
#Z	 int	1680	 The Absolute Integer Z Position of the object
#Yaw	 byte	-27	 The X Axis rotation as a fraction of 360
#Pitch	 byte	0	 The Y Axis rotation as a fraction of 360
#Data Stream	 Metadata	127	 Indexed metadata for Mob (STILL DECODING!). Terminated by 0xf7.