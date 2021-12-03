class Address < ApplicationRecord
    has_many :users
    geocoded_by :address
    
    def address
        [street, city, state, country, pin_code].compact.join(", ")
    end

end
