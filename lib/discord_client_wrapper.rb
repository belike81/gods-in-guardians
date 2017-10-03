class DiscordClientWrapper
  class << self
    def client_id=(value)
      @client_id = value
    end

    def token=(value)
      @token = value
    end

    def init
      yield(self) if block_given?
    end

    def client
      return @client unless @client.nil?

      @client = Discordrb::Commands::CommandBot.new(
        token: @token,
        client_id: @client_id,
        prefix: '!'
      )
    end
  end
end
