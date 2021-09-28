# frozen_string_literal: true

class AddIndexOnUsages < ActiveRecord::Migration[6.1]
  def change
    add_index :usages, :plan_id
  end
end
