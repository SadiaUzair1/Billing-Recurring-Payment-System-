class RemoveCol2FromPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :col2
  end
end
