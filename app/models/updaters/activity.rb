require "#{Rails.root}/lib/api_wrapper"

class Updaters::Activity
  def initialize(users, api = ApiWrapper.new)
    @users = users
    @api = api
  end

  def update
    ::Activity.destroy_all
    stats = get_activity_stats
    @users.each do |user|
      user.characters.each do |character|
        next unless stats[user.id][character.id]['activities']
        stats[user.id][character.id]['activities'].each do |activity_stats|
          ::Activity.create!({
                              user: user,
                              character: character,
                              activity_name: get_activity_name(activity_stats['activityHash']),
                              activity_type: get_activity_type(activity_stats['activityHash']),
                              activity_hash: activity_stats['activityHash'],
                              times_completed: activity_stats['values']['activityCompletions']['basic']['value'],
                              kills: activity_stats['values']['activityKills']['basic']['value'],
                              deaths: activity_stats['values']['activityDeaths']['basic']['value'],
                              assists: activity_stats['values']['activityAssists']['basic']['value'],
                              kd: activity_stats['values']['activityKillsDeathsRatio']['basic']['value'],
                              wins: activity_stats['values']['activityWins']['basic']['value'],
                              seconds_played: activity_stats['values']['activitySecondsPlayed']['basic']['value']
                            })
        end
      end
    end
  end

  private

  def get_activity_name(hash)
    ::ActivityName.where(activity_hash: hash).first_or_create do |activity_name|
      activity_name.value = 'No name'
    end
  end

  def get_activity_type(hash)
    activity_name = ::ActivityName.where(activity_hash: hash).first
    if activity_name
      ::ActivityType.where(activity_type_hash: activity_name.activity_type_hash).first_or_create do |activity_type|
        activity_type.value = 'No name'
      end
    end
  end

  def get_activity_stats
    @stats ||= updated_activity_stats
  end

  def updated_activity_stats
    @stats = {}
    @users.each do |user|
      character_stats = {}
      user.characters.each do |character|
        character_stats[character.id] = @api.get_activity_stats(user.membership_id, character.character_id, user.platform).data
      end
      @stats[user.id] = character_stats
    end
    @stats
  end
end
