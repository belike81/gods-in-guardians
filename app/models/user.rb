class User < ApplicationRecord
  has_many :characters
  has_many :activities, -> { select('DISTINCT ON (activity_names.value) activities.activity_name_id, activities.id, s.kills, s.deaths, s.times_completed, s.assists, s.wins, s.seconds_played').joins("JOIN(SELECT activity_names.value, SUM(kills) AS kills, SUM(deaths) AS deaths, SUM(times_completed) AS times_completed, SUM(assists) AS assists, SUM(wins) AS wins, SUM(seconds_played) AS seconds_played FROM activities INNER JOIN activity_names on activity_names.id = activity_name_id GROUP BY activity_names.value) AS s ON activity_names.value = s.value") }

  has_one :pve_base_stat
  has_one :pve_kills_weapon
  has_one :pvp_base_stat
  has_one :pvp_kills_weapon

  delegate :kills, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :deaths, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :kd, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :assists, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :most_kills, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :suicides, to: :pvp_base_stat, prefix: true, allow_nil: true

  delegate :kills, to: :pve_base_stat, prefix: true, allow_nil: true
  delegate :deaths, to: :pve_base_stat, prefix: true, allow_nil: true
  delegate :kd, to: :pve_base_stat, prefix: true, allow_nil: true
  delegate :assists, to: :pve_base_stat, prefix: true, allow_nil: true
  delegate :most_kills, to: :pve_base_stat, prefix: true, allow_nil: true
  delegate :suicides, to: :pve_base_stat, prefix: true, allow_nil: true

  delegate :super, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :granade, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :melee, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :auto_rifle, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :fusion, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :hand_canon, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :machine_gun, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :pulse_rifle, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :rocket_launcher, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :scout_rifle, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :shotgun, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :sniper, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :side_arm, to: :pvp_kills_weapon, prefix: true, allow_nil: true
  delegate :sword, to: :pvp_kills_weapon, prefix: true, allow_nil: true

  delegate :super, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :granade, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :melee, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :auto_rifle, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :fusion, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :hand_canon, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :machine_gun, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :pulse_rifle, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :rocket_launcher, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :scout_rifle, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :shotgun, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :sniper, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :side_arm, to: :pve_kills_weapon, prefix: true, allow_nil: true
  delegate :sword, to: :pve_kills_weapon, prefix: true, allow_nil: true
end
