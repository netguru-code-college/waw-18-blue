class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :rate, presence: true, format: {with: /[1-9]/,
    message: "only numbers between 1 and 9" }

  validates :desc, presence: true, length: {minimum: 10}
end
