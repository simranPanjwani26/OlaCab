class AddDistanceToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :distance, :float
  end
end
