require 'mc_proxy/packets/base'

module McProxy::Packets
  class HoldingChange < Base
    attr_reader :slot_id

    schema do
      byte :packet_id
      short :slot_id
    end

    def to_s
      "<HoldingChange slot_id=#{self.slot_id}>"
    end

    

  end
end