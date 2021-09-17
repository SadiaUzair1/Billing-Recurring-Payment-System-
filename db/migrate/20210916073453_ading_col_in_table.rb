# frozen_string_literal: true

class AdingColInTable < ActiveRecord::Migration[6.1]
  def change
    remove_column(:plan_usages, :user_id_id, :integer)
    add_reference :plan_usages, :user, index: true, null: false, default: 0
  end
end
