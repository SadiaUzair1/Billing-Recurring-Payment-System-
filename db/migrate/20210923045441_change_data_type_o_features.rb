# frozen_string_literal: true

class ChangeDataTypeOFeatures < ActiveRecord::Migration[6.1]
  def change
    change_table :features, bulk: true do |_t|
      change_column :features, :code, :string, null: true, default: ''
      change_column :features, :unit_price, :float, null: true, default: 0.0
    end
    change_column :plans, :monthly_fee, :float, null: true, default: 0.0
  end
end
