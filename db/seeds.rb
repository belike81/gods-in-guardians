require "#{Rails.root}/lib/api_wrapper"

# Get initial users from GGS

GGS_USERNAMES = [
    { name: 'belike81', platform: 2 },
    { name: 'belike81', platform: 3 },
    { name: 'kasta71', platform: 2 },
    { name: 'majki_pl', platform: 2},
    { name: 'ouara_of_death', platform: 2},
    { name: 'ouara', platform: 3 },
    { name: 'piotrlupicki', platform: 2},
    { name: 'wroobel237', platform: 2},
    { name: 'sarzasty', platform: 2},
    { name: 'ropel432', platform: 2},
    { name: 'czarny00pl', platform: 2},
    { name: 'w1chajster', platform: 2}
]

GGS_USERNAMES.each do |username|
  user = ApiWrapper.new.get_user_by_name(username[:name], username[:platform])

  begin
    if user.valid? && !User.where(name: user.data.first['displayName'], platform: username[:platform]).first
      User.create(name: user.data.first['displayName'], membership_id: user.data.first['membershipId'], platform: username[:platform])
    end
  rescue => e
    puts "Error in user creation: #{e}"
  end

end
