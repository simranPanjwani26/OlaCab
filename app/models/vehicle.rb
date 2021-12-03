class Vehicle < ApplicationRecord
    has_many :bookings 
    has_one_attached :image, :dependent => :destroy
    # geocoded_by :pick_up
    # geocoded_by :drop
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode
    
end
