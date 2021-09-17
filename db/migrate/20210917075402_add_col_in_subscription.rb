class AddColInSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :status, :integer, null: false, default: 0
  end
end
