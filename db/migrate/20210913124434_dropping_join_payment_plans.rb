class DroppingJoinPaymentPlans < ActiveRecord::Migration[6.1]
  def change
    drop_table :join_payment_plans
    drop_table :plan_usage_tables
  end
end
