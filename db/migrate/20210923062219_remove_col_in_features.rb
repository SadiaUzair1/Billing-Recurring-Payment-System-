# frozen_string_literal: true

class RemoveColInFeatures < ActiveRecord::Migration[6.1]
  def change
    remove_column :features, :total_amount, :integer
  end
end
