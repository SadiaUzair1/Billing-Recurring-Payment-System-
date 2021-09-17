# frozen_string_literal: true

class DroppingJoinPaymentPlans < ActiveRecord::Migration[6.1]
  def change
    drop_table :join_payment_plans do |t|
    end

    drop_table :plan_usage_tables do |t|
    end
  end
end
