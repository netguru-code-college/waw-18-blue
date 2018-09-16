class Location < ApplicationRecord
  AVAILABLE_TYPES = %w(pub outside restaurant house_party roof_party)

  has_many :events, dependent: :destroy
  has_many :ratings, dependent: :destroy


  validates :location_type, inclusion: { in: AVAILABLE_TYPES ,
    message: "unnknown type" }

end
