# frozen_string_literal: true

class AddPlansAndUsersToPayments < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :plan
    add_reference :payments, :user
  end
end
