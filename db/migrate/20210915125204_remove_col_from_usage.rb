class RemoveColFromUsage < ActiveRecord::Migration[6.1]
  def change
    remove_column :plan_usages, :feature_max_limit, :integer, null: false, default: ''
  end
end
