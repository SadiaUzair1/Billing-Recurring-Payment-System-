# frozen_string_literal: true

class AddConstraintInFeatures < ActiveRecord::Migration[6.1]
  def change
    add_check_constraint :features, 'unit_price > 100', name: 'price_check'

    add_check_constraint :features, 'max_unit_limit > 0', name: 'limit_check'
  end
end
