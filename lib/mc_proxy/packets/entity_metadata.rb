require 'mc_proxy/packets/base'

module McProxy::Packets
  class EntityMetadata < Base

    attr_reader :entity_id
    attr_reader :entity_metadata

    schema do
      int :entity_id
      stream :entity_metadata
    end

  end
end