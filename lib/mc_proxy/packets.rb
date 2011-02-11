module McProxy
  module Packets; end
end

%w(
  add_object
  animation
  attach_entity
  block_change
  chat_message
  close_window
  collect_item
  destroy_entity
  entity
  entity_action
  entity_equipment
  entity_look
  entity_look_and_relative_move
  entity_metadata
  entity_painting
  entity_relative_move
  entity_status
  entity_teleport
  entity_velocity
  explosion
  handshake
  holding_change
  keep_alive
  kick
  login
  map_chunk
  mob_spawn
  multi_block_change
  named_entity_spawn
  open_window
  pickup_spawn
  play_note_block
  player
  player_block_placement
  player_digging
  player_look
  player_position
  player_position_and_look
  prechunk
  respawn
  set_slot
  spawn_position
  time_update
  transaction
  update_health
  update_progress_bar
  update_sign
  use_entity
  window_click
  window_items
).each do |packet|
  require "mc_proxy/packets/#{packet}"
end

module McProxy
  module Packets
    
    class << self

      # Parse through data and yield each packet to provided block
      #
      def each_packet(data, destination, &block)
        can_parse = !data.empty?

        while can_parse
          return [] if data.empty?

          klass = Packets.class_for(data.first.to_s)

          begin
            packet = klass.parse(data, destination)
          rescue NotEnoughDataError
            return data
          end

          if packet
            block.call(packet)
            data = data[packet.bytesize..-1]
          else
            can_parse = false
          end
        end

        data
      end

      def class_for(packet_id)
        puts "class_for: #{packet_id}"
        case packet_id.to_i
        when 0
          KeepAlive
        when 1
          Login
        when 2
          Handshake
        when 3
          ChatMessage
        when 4
          TimeUpdate
        when 5
          EntityEquipment
        when 6
          SpawnPosition
        when 7
          UseEntity
        when 8
          UpdateHealth
        when 9
          Respawn
        when 10
          Player
        when 11
          PlayerPosition
        when 12
          PlayerLook
        when 13
          PlayerPositionAndLook
        when 14
          PlayerDigging
        when 15
          PlayerBlockPlacement
        when 16
          HoldingChange
        when 18
          Animation
        when 19
          EntityAction
        when 20
          NamedEntitySpawn
        when 21
          PickupSpawn
        when 22
          CollectItem
        when 23
          AddObject
        when 24 # 0x18
          MobSpawn
        when 25
          EntityPainting
        when 28
          EntityVelocity
        when 29 # 01D
          DestroyEntity
        when 30
          Entity
        when 31
          EntityRelativeMove
        when 32
          EntityLook
        when 33
          EntityLookAndRelativeMove
        when 34
          EntityTeleport
        when 38
          EntityStatus
        when 39
          AttachEntity
        when 40
          EntityMetadata
        when 50 # 0x32
          Prechunk
        when 51
          MapChunk
        when 52
          MultiBlockChange
        when 53
          BlockChange
        when 54
          PlayNoteBlock
        when 60
          Explosion
        when 100
          OpenWindow
        when 101
          CloseWindow
        when 102
          WindowClick
        when 103
          SetSlot
        when 104
          WindowItems
        when 105
          UpdateProgressBar
        when 106
          Transaction
        when 130
          UpdateSign
        when 255
          Kick
        else
          KeepAlive
        end          
      end
      
    end
    
  end
end