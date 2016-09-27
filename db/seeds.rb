require "#{Rails.root}/lib/api_wrapper"

# Get initial users from GGS

GGS_USERNAMES = %w(belike81 kasta71 majki_pl ouara_of_death piotrlupicki wroobel237 sarzasty ropel432)

GGS_USERNAMES.each do |username|
  user = ApiWrapper.new.get_user_by_name(username)
  if user
    User.create(name: user.first['displayName'], membership_id: user.first['membershipId'])
  end
end
