# frozen_string_literal: true

class AddForeignKeyInPayment < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :subscription
  end
end
