class Vehicle < ApplicationRecord
    has_many :bookings 
    has_one_attached :image, :dependent => :destroy

    # def self.search (params)
    #     puts "start searching"
    #     results = location_matches(pick_up, drop, params[:pick_up], params[:drop]) 
    #     return nil unless results
    #     results
    # end
end
