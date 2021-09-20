# frozen_string_literal: true

class AddColInPaymentsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :status, :integer, null: false, default: 0
  end
end
