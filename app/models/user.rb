class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:member, :driver, :admin]
  
  has_many :bookings 
  
end
