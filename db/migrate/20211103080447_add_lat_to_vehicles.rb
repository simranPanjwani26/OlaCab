class AddLatToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :lat, :float
  end
end
