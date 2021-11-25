class Vehicle < ApplicationRecord
    has_many :bookings 
    has_one_attached :image, :dependent => :destroy
    # enum status: [:available, :booked]  

    geocoded_by :pick_up
    geocoded_by :drop
    reverse_geocoded_by :latitude, :longitude
    after_validation :geocode
    # # validates_inclusion_of :status, in: STATUS
    # # validates_uniqueness_of :license_number

    # scope :available_vehicles, -> { where(status: 'available').order(created_at: 'desc') }
    
  #   geocoded_by :address # address is an attribute of MyModel

  # # or with a method
  #   geocoded_by :full_address # full_address is a method which take some model's attributes to get a formatted address for example

  # # the callback to set longitude and latitude
  #   after_validation :geocode

  # # the full_address method
  #   def full_address
  #       "#{address}, #{pincode}, #{city}, #{country}"
  #   end
    
    # def self.search(pick_up)
    #     if search
    #         Vehicle.where('location LIKE?', pick_up)
    #     else
    #         Vehicle.all
    #     end
    #     # puts "start searching"
        # results = location_matches(pick_up, drop, params[:pick_up], params[:drop]) 
        # return nil unless results
        # results
    # end

    # def available?
    #     status == 'available'
    # end

    # def book(user_id, lat, Long)
    #     return false unless available?
    #     update_attribute(:status, 'booked')
    #     Booking.create!(vehicle_id: id, user_id: user_id, starting_lat: lat, starting_long: Long, status: 'scheduled')
    # end

    # def self.car_list
    #     available_vehicles
    #   end
    
    # def self.nearest(lat, Long)
    #     nearest_vehicle = nil
    #     shortest_distance = Float::INFINITY
    #     vehicle_list.each do |vehicle|
    #       distance = Math.sqrt((lat - vehicle.lat)**2 + (Long - vehicle.lat)**2)
    #       if distance < shortest_distance
    #         shortest_distance = distance
    #         nearest_vehicle = @vehicle
    #       end
    #     end
    #     nearest_vehicle
    #   end
end
