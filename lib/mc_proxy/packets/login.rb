require 'mc_proxy/packets/base'

module McProxy::Packets

  # Login
  #
  # C --> S
  # Sent by the client after the handshake to finish logging in. If the version is outdated or any field is invalid,
  # the server will disconnect the client with a kick. If the client is started in offline mode, the player's username
  # will default to Player, making LAN play with more than one player impossible (without authenticating) as the
  # server will prevent multiple users with the same name.
  #
  # S --> C
  # Sent by the server if it accepts the clients login request. If it didn't, it'll send a kick instead.
  #
  class Login < Base
    PACKET_ID = 1

    attr_accessor :field_one, :username, :password, :map_seed, :dimension

    schema do
      int :field_one
      text :username
      text :password
      long :map_seed
      byte :dimension
    end

    def to_s
      "Login"
    end

  end
end