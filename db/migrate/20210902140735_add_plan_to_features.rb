# frozen_string_literal: true

class AddPlanToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_reference :features, :plan
  end
end
