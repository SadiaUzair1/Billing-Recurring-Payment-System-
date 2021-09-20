# frozen_string_literal: true

class RemoveplanUSage < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :plan_usage_table_id
    remove_column :subscriptions, :plan_usage_table_id

    remove_column :plans, :plan_usage_table_id
    drop_table :plan_usage_tables
  end
end
