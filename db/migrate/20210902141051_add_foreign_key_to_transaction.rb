class AddForeignKeyToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :transactions, :plans
  end
end
