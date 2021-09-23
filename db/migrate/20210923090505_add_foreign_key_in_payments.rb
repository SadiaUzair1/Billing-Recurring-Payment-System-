# frozen_string_literal: true

class AddForeignKeyInPayments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :payments, :subscriptions
  end
end
