# frozen_string_literal: true

class AddPlanToSubscriptiions < ActiveRecord::Migration[6.1]
  def change
    add_reference :subscriptions, :plan
  end
end
