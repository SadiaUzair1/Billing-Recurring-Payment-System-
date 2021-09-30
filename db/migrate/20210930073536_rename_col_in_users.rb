class RenameColInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :userType, :user_type
  
  end
end
