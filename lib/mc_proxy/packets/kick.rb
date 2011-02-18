require 'mc_proxy/packets/base'

module McProxy::Packets
  class Kick < Base

    attr_reader :reason

    schema do
      byte :packet_id
      text :reason
    end

    def to_s
      "<Kick reason=\"#{self.reason}\">" + 
      "  +--> RAW: #{self.raw.inspect}"
    end

  end
end