class Vehicle < ApplicationRecord

    has_many :bookings ,through: :users
end
