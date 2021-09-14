class RemovePlanFromPayments < ActiveRecord::Migration[6.1]
  def change
    remove_column :payments, :plan_id
  end
end
