class AddPlanUsageToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plans, :plan_usage_table
    add_reference :subscriptions, :plan_usage_table
    add_reference :users, :plan_usage_table
  end
end
