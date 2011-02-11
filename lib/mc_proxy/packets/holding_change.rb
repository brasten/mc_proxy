require 'mc_proxy/packets/base'

module McProxy::Packets
  class HoldingChange < Base
    PACKET_ID = 16
    SIZE = 3

  end
end