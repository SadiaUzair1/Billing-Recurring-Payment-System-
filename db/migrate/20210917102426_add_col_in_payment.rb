class AddColInPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :plan_id, :integer, null: false, default: 0
  end
end
