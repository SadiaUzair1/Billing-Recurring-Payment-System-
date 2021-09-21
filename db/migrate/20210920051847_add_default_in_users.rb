# frozen_string_literal: true

class AddDefaultInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :userType, :string, null: false, default: 'buyer'
  end
end
