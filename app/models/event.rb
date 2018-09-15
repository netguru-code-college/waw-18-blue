class Event < ApplicationRecord
  belongs_to :location
  validates :desc, presence: true
end
