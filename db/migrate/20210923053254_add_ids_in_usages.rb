# frozen_string_literal: true

class AddIdsInUsages < ActiveRecord::Migration[6.1]
  def change
    change_table(:usages, bulk: true) do |t|
      t.integer :plan_id, null: false, default: 0
      t.integer :feature_id, null: false, default: 0
    end
  end
end
