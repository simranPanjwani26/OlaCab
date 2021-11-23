class RemovePhoneNoFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :phone_no, :integer
  end
end
