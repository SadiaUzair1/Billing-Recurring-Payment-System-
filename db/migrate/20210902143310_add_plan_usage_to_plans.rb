class AddPlanUsageToPlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :plan_usage_tables,:plans, null: false, foreign_key: true
  end
end
