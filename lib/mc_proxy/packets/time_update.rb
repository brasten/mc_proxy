require 'mc_proxy/packets/base'

module McProxy::Packets
  class TimeUpdate < Base
    PACKET_ID = 4
    SIZE = 9

  end
end