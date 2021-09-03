class CreatePlanUsageTables < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_usage_tables do |t|

      t.timestamps
    end
  end
end
