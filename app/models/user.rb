class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:customer, :driver, :admin]
  
  has_many :bookings 
  
end
