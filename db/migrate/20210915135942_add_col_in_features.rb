# frozen_string_literal: true

class AddColInFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :total_amount, :integer, null: false, default: ''
  end
end
