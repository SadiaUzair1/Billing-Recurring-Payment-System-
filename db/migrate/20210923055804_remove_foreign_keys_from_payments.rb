# frozen_string_literal: true

class RemoveForeignKeysFromPayments < ActiveRecord::Migration[6.1]
  def change
    drop_table :payments_and_plans_ids do |t|
      t.string :plan_id
      t.string :payment_id
    end
  end
end
