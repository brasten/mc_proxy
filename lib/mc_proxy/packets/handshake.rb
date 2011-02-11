require 'bit-struct'
require 'mc_proxy/packets/base'

module McProxy::Packets

  # Handshake
  #
  # C --> S
  # This is the first packet sent when the client connects and is used for Authentication.
  #
  # S --> C
  # This is the first packet sent when the client connects and is used for Authentication. If the hash is '-',
  # then the client continues without doing name authentication. If the hash is a '+', the client sends the server
  # password in the login request. (Note that this hash, as of the latest version of the Beta server, is a randomly
  # generated long in hexadecimal form, and has nothing to do with the client or the server he is connected to)
  #
  class Handshake < Base
    PACKET_ID = 2

    attr_reader :field_one

    schema do
      text :field_one
    end

    def username
      @username ||= self.field_one
    end
    
    def to_s
      "Handshake (to #{self.destination}):#{self.field_one}"
    end

  end
end