# frozen_string_literal: true

class CreateJoinPaymentPlan < ActiveRecord::Migration[6.1]
  def change
    create_table :join_payment_plans do |t|
      t.string :payments
      t.string :plans
      t.timestamps
    end
  end
end
