# frozen_string_literal: true

class AddUserToSubscriptiions < ActiveRecord::Migration[6.1]
  def change
    add_reference :subscriptions, :user
  end
end
