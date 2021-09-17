# frozen_string_literal: true

class RemoveColFromPlanUsage < ActiveRecord::Migration[6.1]
  def change
    remove_column(:subscriptions, :status, :string)
    remove_column(:plan_usage, :feature_name, :string)
  end
end
