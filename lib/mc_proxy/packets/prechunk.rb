require 'mc_proxy/packets/base'

module McProxy::Packets
  class Prechunk < Base
    attr_reader :x
    attr_reader :z
    attr_reader :mode

    schema do
      int :x
      int :z
      byte :mode
    end

    def to_s
      puts "#{@mode ? 'Initializing' : 'Clearing'} #{@x}, #{@z}"
    end
  end
end