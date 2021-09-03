class AddUserToSubscriptiions < ActiveRecord::Migration[6.1]
  def change
    add_reference :subscriptions, :user, null: false, foreign_key: true
  end
end
