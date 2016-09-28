class ApiWrapper
  def initialize(client = BungieClientWrapper.client)
    @client = client
  end

  def get_user_by_name(name)
    @client.get_response "/Destiny/SearchDestinyPlayer/2/#{name}"
  end

  def get_account_stats(membership_id)
    @client.get_response "/Destiny/Stats/Account/2/#{membership_id}"
  end
end
