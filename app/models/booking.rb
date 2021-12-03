class Booking < ApplicationRecord
    require 'csv'
    belongs_to :user, dependent: :destroy
    belongs_to :vehicle, :optional => true, dependent: :destroy

    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %W{booking_id pick_up drop distance booking_price}
                all.each do |booking|

                    # u_email = User.find(booking.user_id).email

                    csv << [
                        booking.id,
                        booking.pick_up,
                        booking.drop,
                        booking.distance,
                        booking.booking_price,
                        # u_email
                    ]

                
            end
        end

    end
   
end
