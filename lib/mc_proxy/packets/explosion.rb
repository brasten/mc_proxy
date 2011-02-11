require 'mc_proxy/packets/base'

module McProxy::Packets
  class Explosion < Base

    schema do
      double :x
      double :y
      double :z
      float :radius
      records(:records) do
        byte :x
        byte :y
        byte :z
      end
    end

  end
end