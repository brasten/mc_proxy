require 'mc_proxy/packets/base'

module McProxy::Packets
  class UpdateHealth < Base
    attr_reader :health

    schema do
      byte :packet_id
      short :health
    end

    def to_s
      "<UpdateHealth health=#{self.health}>"
    end
  end
end