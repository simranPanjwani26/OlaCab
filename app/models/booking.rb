class Booking < ApplicationRecord

    belongs_to :user, dependent: :destroy
    belongs_to :vehicle, :optional => true, dependent: :destroy
   
end
