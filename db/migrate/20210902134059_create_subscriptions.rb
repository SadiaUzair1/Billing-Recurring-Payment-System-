# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions, &:timestamps
  end
end
