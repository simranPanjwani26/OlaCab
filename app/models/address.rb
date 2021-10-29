class Address < ApplicationRecord
    has_many :users
    geocoded_by :address
    #  After_validation :geocode 
    #  if: address_changed?

    def address
        [street, city, state, country, pin_code].compact.join(", ")
    end

    # def address_changed?
    #     street_changed?||city_changed?||pin_code_changed?||state_changed? 
    # end

    # Location.within_bounding_box(sw_corner, ne_corner)
end
