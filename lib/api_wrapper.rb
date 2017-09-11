class ApiWrapper
  def initialize(client = BungieClientWrapper.client)
    @client = client
  end

  def get_user_by_name(name)
    @client.get("/Destiny2/SearchDestinyPlayer/2/#{name}")
  end

  def get_account_stats(membership_id)
    @client.get("/Destiny2/Stats/Account/2/#{membership_id}")
  end

  def get_account_details(membership_id)
    @client.get("/Destiny2/2/Account/#{membership_id}")
  end

  def get_activity_stats(membership_id, character_id)
    @client.get("Destiny2/Stats/AggregateActivityStats/2/#{membership_id}/#{character_id}")
  end

  def get_activity_details(hash)
    @client.get("Destiny2/Manifest/Activity/#{hash}")
  end
end
