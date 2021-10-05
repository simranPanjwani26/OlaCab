class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :pick_up_time
      t.datetime :return_time
      t.string :booking_status
      
      t.integer :booking_price

      t.timestamps
    end
  end
end
