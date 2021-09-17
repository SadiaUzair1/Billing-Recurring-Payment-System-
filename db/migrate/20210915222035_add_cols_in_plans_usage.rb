# frozen_string_literal: true

class AddColsInPlansUsage < ActiveRecord::Migration[6.1]
  def change
    remove_column(:plan_usages, :user_id_id, :integer)

    change_table :plan_usages, bulk: true do |t|
      t.integer :max_unit_limit, null: false, default: 0
      t.integer :increased_units, null: false, default: 1
      t.integer :amount, null: false, default: 0
      t.string :features_name, null: false, default: ''
    end
  end
end
