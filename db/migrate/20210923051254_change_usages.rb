# frozen_string_literal: true

class ChangeUsages < ActiveRecord::Migration[6.1]
  def change
    change_table(:usages, bulk: true) do |_t|
      remove_column(:usages, :amount, :integer)
      remove_column(:usages, :max_unit_limit, :integer)
      remove_column(:usages, :feature_name, :string)
      remove_column(:usages, :features_name, :string)
      remove_column(:usages, :plan_name, :string)
      remove_column(:usages, :subscription_id, :integer)
      add_reference :usages, :subscription
    end
  end
end
