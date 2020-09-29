class ApiWrapper
  attr_reader :data

  def initialize(client = BungieClientWrapper.client)
    @client = client
    @data = {}
    @valid = false
  end

  def get_user_by_name(name, platform = 2)
    get_response_from("Destiny2/SearchDestinyPlayer/#{platform}/#{name}")
  end

  def get_account_stats(membership_id, platform = 2)
    get_response_from("Destiny2/#{platform}/Account/#{membership_id}/Stats")
  end

  def get_account_details(membership_id, platform = 2)
    get_response_from("Destiny2/#{platform}/Profile/#{membership_id}?components=profiles")
  end

  def get_activity_stats(membership_id, character_id, platform = 2)
    get_response_from("Destiny2/#{platform}/Account/#{membership_id}/Character/#{character_id}/Stats/AggregateActivityStats/")
  end

  def get_activity_details(hash)
    get_response_from("Destiny2/Manifest/Activity/#{hash}")
  end

  def valid?
    @valid && @data.any?
  end

  private

  def get_response_from(endpoint)
    response = @client.get(endpoint)
    if response["ErrorStatus"] == "Success"
      @valid = true
      @data = response["Response"]
    end

    self
  end
end
