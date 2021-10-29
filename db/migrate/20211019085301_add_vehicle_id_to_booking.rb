class AddVehicleIdToBooking < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :vehicle, null: false, foreign_key: true
  end
end
