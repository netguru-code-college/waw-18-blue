class Location < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
