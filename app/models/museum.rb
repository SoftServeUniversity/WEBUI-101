class Museum < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates :latitude, presence: false
	validates :longitude, presence: false
	geocoded_by :address
	after_validation :geocode
end
