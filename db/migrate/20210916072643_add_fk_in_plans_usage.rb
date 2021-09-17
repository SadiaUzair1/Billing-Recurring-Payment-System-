# frozen_string_literal: true

class AddFkInPlansUsage < ActiveRecord::Migration[6.1]
  def change
    add_column :plan_usages, :increased_units, :string, null: false, default: 1
  end
end
