class User < ApplicationRecord
  has_one :pvp_base_stat
  has_one :pvp_kills_weapon
end
