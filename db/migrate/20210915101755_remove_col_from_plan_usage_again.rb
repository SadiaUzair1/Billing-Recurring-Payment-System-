# frozen_string_literal: true

class RemoveColFromPlanUsageAgain < ActiveRecord::Migration[6.1]
  def change
    remove_column(:plan_usage, :subscription_id, :integer)
  end
end
