# frozen_string_literal: true

class RemovingColInPayments < ActiveRecord::Migration[6.1]
  def change
    change_table :payments, bulk: true do |_t|
      remove_column :payments, :next_billing_day, :date
      remove_column :payments, :status, :string
    end
    add_column :users, :billing_date, :datetime, null: false, default: Time.zone.today
  end
end
