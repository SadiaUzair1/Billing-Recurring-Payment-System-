# frozen_string_literal: true

class AddColInPayments < ActiveRecord::Migration[6.1]
  def change
    change_table :payments, bulk: true do |t|
      t.integer :payment, null: false, default: 0
      t.string :billing_day, null: false, default: ''
    end
  end
end
