require 'mc_proxy/packets/base'

module McProxy::Packets
  class Kick < Base

    attr_reader :reason

    schema do
      text :reason
    end

    def to_s
      "KICKED! Because: #{self.reason}"
    end

  end
end