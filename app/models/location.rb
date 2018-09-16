class Location < ApplicationRecord
  AVAILABLE_TYPES = %w(pub outside restaurant house_party roof_party)

  before_save :geocode_address
  has_many :events, dependent: :destroy
  has_many :ratings, dependent: :destroy


  validates :location_type, inclusion: { in: AVAILABLE_TYPES ,
    message: "unnknown type" }

  validates :name, presence: true, length: {minimum: 5}
  validates :location_type, presence: true

  #validates :address, :longitude, :latitude, presence: true

  def geocode_address
    return if address.blank?
    results = Geocoder.search(address).first
		data = results.data['address']
		addresses = [data['road'], data['house_number'], data['city'], data['country']].compact.join(' ,')
		self.address = addresses
    self.latitude = results.latitude
    self.longitude = results.longitude
  end
end
