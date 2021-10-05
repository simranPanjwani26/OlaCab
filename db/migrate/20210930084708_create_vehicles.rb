class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.string :license_number
      t.string :vehicle_model
      t.string :location 
      t.string :status

      t.timestamps
    end
  end
end
