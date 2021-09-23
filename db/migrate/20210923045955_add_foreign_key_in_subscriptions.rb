# frozen_string_literal: true

class AddForeignKeyInSubscriptions < ActiveRecord::Migration[6.1]
  def change
    rename_table :plan_usages, :usages
  end
end
