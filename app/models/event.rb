class Event < ApplicationRecord
  belongs_to :location
  validates :name, :start_time, :end_time, presence: true
  validate :start_time_must_be_before_end_time

  private
  def start_time_must_be_before_end_time
    if start_time >= end_time
      self.errors.add(:end_time, "start_time must be before end_time")
    end
  end
end
