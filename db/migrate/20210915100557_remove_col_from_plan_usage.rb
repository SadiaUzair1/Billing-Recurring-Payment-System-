class RemoveColFromPlanUsage < ActiveRecord::Migration[6.1]
  def change
    remove_column :plan_usage, :feature_name
    remove_column :subscriptions, :status
  end
end
