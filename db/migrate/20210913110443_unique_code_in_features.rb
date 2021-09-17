# frozen_string_literal: true

class UniqueCodeInFeatures < ActiveRecord::Migration[6.1]
  def change
    add_index :features, :code
  end
end
