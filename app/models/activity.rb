class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :activity_name
  belongs_to :activity_type

  default_scope { joins(:activity_name, :activity_type) }
  scope :pvp, -> { all.merge(ActivityType.pvp) }
  scope :pve, -> { all.merge(ActivityType.pve) }
  scope :with_type, ->(hash) { joins(:activity_type).where(activity_types: {activity_type_hash: hash}) }
end
