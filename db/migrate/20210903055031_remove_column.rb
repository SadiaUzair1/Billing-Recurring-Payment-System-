class RemoveColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :plan_id

  end
end
