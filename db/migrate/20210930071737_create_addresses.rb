class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :pin_code
      t.string :street
      t.timestamps
      
    end
  end
end
