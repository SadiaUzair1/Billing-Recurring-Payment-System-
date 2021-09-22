# frozen_string_literal: true

class PaymentPlanIds < ActiveRecord::Migration[6.1]
  def chang
    create_table :payments_and_plans_ids do |t|
      t.integer :plan_id
      t.integer :payment_id
      t.references :plans, foreign_key: true
      t.references :payments, foreign_key: true

      t.timestamps
    end
  end
end
