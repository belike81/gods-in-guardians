class User < ApplicationRecord
  has_one :pvp_base_stat
  has_one :pvp_kills_weapon

  delegate :kills, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :deaths, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :kd, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :assists, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :most_kills, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :suicides, to: :pvp_base_stat, prefix: true, allow_nil: true

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
end
