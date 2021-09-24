# frozen_string_literal: true

class RemoveUserIdFromUsages < ActiveRecord::Migration[6.1]
  def change
    remove_column :usages, :user_id, :integer
  end
end
