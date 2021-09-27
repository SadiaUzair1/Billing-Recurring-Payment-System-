# frozen_string_literal: true

class ChangeColNamePayments < ActiveRecord::Migration[6.1]
  def change
    rename_column :payments, :billing_day, :payment_date
  end
end
