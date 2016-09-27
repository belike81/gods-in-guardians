require "#{Rails.root}/lib/bungie_client_wrapper"

BungieClientWrapper.init do |config|
  config.api_key = Rails.application.secrets.bungie_api_key
end
