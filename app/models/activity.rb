class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :activity_name
  belongs_to :activity_type
end
