class BotWrapper
  def initialize(client = DiscordClientWrapper.client)
    @client = client
  end

  def run
    @client.command :random do |event, min, max|
      rand(min.to_i .. max.to_i)
    end

    @client.run :async
  end
end
