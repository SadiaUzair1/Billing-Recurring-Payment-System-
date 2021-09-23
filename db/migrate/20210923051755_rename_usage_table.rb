# frozen_string_literal: true

class RenameUsageTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :usages, :increased_units, :used_units
    remove_column :usages, :feature_max_limit, :integer
  end
end
