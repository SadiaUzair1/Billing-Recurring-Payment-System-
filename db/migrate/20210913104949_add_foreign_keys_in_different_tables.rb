class AddForeignKeysInDifferentTables < ActiveRecord::Migration[6.1]

  def change
    add_foreign_key :features, :plans, index: true
    add_foreign_key :subscriptions, :plans, index: true
    add_foreign_key :subscriptions, :users, index: true
  end
end
