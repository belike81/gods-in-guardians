class EventUser < ApplicationRecord
  belongs_to :event
  validates :name, presence: true, uniqueness: { scope: :event_id, message: 'Player already added to this event' }
end
