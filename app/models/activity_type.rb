class ActivityType < ApplicationRecord
  has_many :activities

  scope :pvp, -> { where("identifier LIKE ?", '%PVP%') }
  scope :pve, -> { where("identifier NOT LIKE ?", '%PVP%') }
end
