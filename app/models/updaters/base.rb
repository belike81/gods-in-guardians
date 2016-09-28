require "#{Rails.root}/lib/api_wrapper"

module Updaters
  class Base
    def initialize(users, api = ApiWrapper.new)
      @users = users
      @api = api
    end

    def update
      character_stats = get_character_stats
      Updaters::Pvp::WeaponKills.new(users, character_stats).update
    end

    private

    def get_character_stats
      @stats ||= updated_character_stats
    end

    def updated_character_stats
      @stats = {}
      @users.each do |user|
        @stats[user.id] = @api.get_account_stats(user.membership_id)
      end
      @stats
    end
  end
end
