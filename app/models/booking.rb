class Booking < ApplicationRecord

    belongs_to :user
    belongs_to :vehicle, :optional => true
    
    geocoded_by :pick_up
    geocoded_by :drop
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode
end
