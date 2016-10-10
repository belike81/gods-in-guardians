require "#{Rails.root}/lib/api_wrapper"

class Updaters::ActivityName
  def initialize(hash, api = ApiWrapper.new)
    @hash = hash
    @api = api
  end

  def update
    stats = get_activity_details
    activity_name = stats ? stats['data']['activity']['activityName'] : 'No name'
    ::ActivityName.create({
                        activity_hash: @hash,
                        value: activity_name
                      })
  end

  private

  def get_activity_details
    @stats ||= updated_activity_details
  end

  def updated_activity_details
    @api.get_activity_details(@hash)
  end
end
