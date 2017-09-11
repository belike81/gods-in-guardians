class BungieClientWrapper
  class << self
    def api_key=(value)
      @api_key = value
    end
    def ttl=(value)
      @ttl = value
    end

    def init
      yield(self) if block_given?
    end

    def client
      return @client unless @client.nil?

      @client = BungieClient::Client.new(
        api_key: @api_key
      )
    end
  end
end
