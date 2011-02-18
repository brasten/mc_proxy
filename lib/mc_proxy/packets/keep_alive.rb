require 'mc_proxy/packets/base'

module McProxy::Packets

  # KeepAlive
  #
  # This packet may be sent to keep the connection alive, or may be a relic of UDP testing. No one is really sure.
  # What we do know is that the Beta server will disconnect a client if it doesn't receive at least one packet
  # before 1200 in-game ticks, and the Beta client will time out the connection under the same conditions.
  #
  class KeepAlive < Base
    PACKET_ID = 0

    schema do
      byte :packet_id
      # nothing
    end

    def to_s
      "<KeepAlive>" +
      "  +--> RAW: #{self.raw.inspect}"
    end

  end
end