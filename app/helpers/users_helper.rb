module UsersHelper
  def calculate_percentage_of_kills(user, stat, type='pvp')
    number_to_percentage((user.send("#{type}_kills_weapon_#{stat.to_s}")/user.send("#{type}_base_stat_kills").to_f)*100, precision: 1)
  end
end
