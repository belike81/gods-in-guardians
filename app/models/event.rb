class Event < ApplicationRecord
  has_many :event_users
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, uniqueness: { scope: [:start_time, :start_date], message: 'Event exists at that time and date' }
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :limit, presence: true, numericality: { only_integer: true }
end
