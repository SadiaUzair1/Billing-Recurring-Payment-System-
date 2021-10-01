# frozen_string_literal: true

class AdjustUsersAttributes < ActiveRecord::Migration[6.1]
  def change
    remove_column(:users, :user_type, :string)
    add_column :users, :user_type, :integer, null: false, default: 0
  end
end
