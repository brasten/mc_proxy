require 'mc_proxy/packets/base'

module McProxy::Packets
  class TimeUpdate < Base
    attr_reader :time

    schema do
      byte :packet_id
      long :time
    end

    def to_s
      "<TimeUpdate time=#{self.time}>"
    end


  end
end