class User < ApplicationRecord
  has_one :pvp_base_stat
  has_one :pvp_kills_weapon

  delegate :kills, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :deaths, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :kd, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :assists, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :most_kills, to: :pvp_base_stat, prefix: true, allow_nil: true
  delegate :suicides, to: :pvp_base_stat, prefix: true, allow_nil: true
end
