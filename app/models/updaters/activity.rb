require "#{Rails.root}/lib/api_wrapper"

class Updaters::Activity
  def initialize(users, api = ApiWrapper.new)
    @users = users
    @api = api
  end

  def update
    stats = get_activity_stats
    @users.each do |user|
      user.activities.destroy_all if user.activities
      user.characters.each do |character|
        stats[user.id][character.id]['data']['activities'].each do |activity_stats|
          ::Activity.create({
                              user: user,
                              character: character,
                              activity_name: get_activity_name(activity_stats['activityHash']),
                              activity_hash: activity_stats['activityHash'],
                              times_completed: activity_stats['values']['activityCompletions']['basic']['value'],
                              kills: activity_stats['values']['activityKills']['basic']['value'],
                              deaths: activity_stats['values']['activityDeaths']['basic']['value'],
                              assists: activity_stats['values']['activityAssists']['basic']['value'],
                              kd: activity_stats['values']['activityKillsDeathsRatio']['basic']['value'],
                              wins: activity_stats['values']['activityWins']['basic']['value']
                            })
        end
      end
    end
  end

  private

  def get_activity_name(hash)
    ::ActivityName.where(activity_hash: hash).first_or_create do |activity_name|
      activity_name.value = Updaters::ActivityName.new(hash).update
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
        character_stats[character.id] = @api.get_activity_stats(user.membership_id, character.character_id)
      end
      @stats[user.id] = character_stats
    end
    @stats
  end
end
