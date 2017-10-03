require "#{Rails.root}/lib/discord_client_wrapper.rb"

DiscordClientWrapper.init do |config|
  config.client_id = Rails.application.secrets.discord_client_id
  config.token = Rails.application.secrets.discord_token
end
