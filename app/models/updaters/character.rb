require "#{Rails.root}/lib/api_wrapper"

class Updaters::Character
  def initialize(users, api = ApiWrapper.new)
    @users = users
    @api = api
  end

  def update
    stats = get_character_stats
    @users.each do |user|
      user.characters.destroy if user.characters
      stats[user.id]['data']['characters'].each do |character_stats|
        ::Character.create({
                             user: user,
                             character_id: character_stats['characterId']
                           })
      end
    end
  end

  private

  def get_character_stats
    @stats ||= updated_character_stats
  end

  def updated_character_stats
    @stats = {}
    @users.each do |user|
      @stats[user.id] = @api.get_account_details(user.membership_id)
    end
    @stats
  end
end
