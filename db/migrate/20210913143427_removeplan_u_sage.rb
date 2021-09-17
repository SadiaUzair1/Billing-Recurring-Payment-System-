# frozen_string_literal: true

class RemoveplanUSage < ActiveRecord::Migration[6.1]
  def change
    remove_column(:plans, :plan_usage_table_id, :integer)
    remove_column(:subscriptions, :plan_usage_table_id, :integer)
    remove_column(:users, :plan_usage_table_id, :integer)

    drop_table :plan_usage_tables do |t|
    end
  end
end
