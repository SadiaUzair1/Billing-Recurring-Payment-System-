class AddUserTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :userType, :string
  end
end
