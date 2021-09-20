class RemoveJoinAndAddPlasUsage < ActiveRecord::Migration[6.1]
    def change
      create_table :plan_usages do |t|
        t.integer :user_id, null: false, default: 0
        t.integer :subscription_id, null: false, default: 0
        t.string :feature_name, null: false, default: ''
        t.string :plan_name, null: false, default: ''
        t.timestamps
      end
      drop_table :join_payment_plans
    end
end
