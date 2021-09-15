# frozen_string_literal: true

class AddColInPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :payment, :integer, null: false, default: ''
    add_column :payments, :billing_day, :string, null: false, default: ''
  end
end
