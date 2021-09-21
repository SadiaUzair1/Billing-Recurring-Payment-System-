# frozen_string_literal: true

class AddColInPlanUsage < ActiveRecord::Migration[6.1]
  def change
    add_column :plan_usages, :feature_max_limit, :integer, null: false, default: ''
  end
end
