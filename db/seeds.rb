require "#{Rails.root}/lib/api_wrapper"

# Get initial users from GGS

GGS_USERNAMES = %w(belike81 kasta71 majki_pl ouara_of_death piotrlupicki wroobel237 sarzasty ropel432 czarny00pl w1chajster radykalnyed threepwood__)

GGS_USERNAMES.each do |username|
  user = ApiWrapper.new.get_user_by_name(username)
  if user && !User.where(name: user['Response'].first['displayName']).first
    User.create(name: user['Response'].first['displayName'], membership_id: user['Response'].first['membershipId'])
  end
end
