class AddDropToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :drop, :string
  end
end
