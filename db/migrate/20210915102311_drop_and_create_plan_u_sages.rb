class DropAndCreatePlanUSages < ActiveRecord::Migration[6.1]
  def change
    drop_table :plan_usage
    create_table :plan_usages do |t|
      t.integer :user_id, null: false, default: 0
      t.string :plan_name, null: false, default: ''
      t.timestamps
    end
  end
end
