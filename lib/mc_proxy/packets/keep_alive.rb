require 'mc_proxy/packets/base'

module McProxy::Packets
  class KeepAlive < Base
    
    class << self
      def parse(data, destination)
        new(destination, [data.bytes.to_a[0]].pack("c"))
      end
    end
    
  end
end