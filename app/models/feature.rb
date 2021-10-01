# frozen_string_literal: true

class Feature < ApplicationRecord
  belongs_to :plan

  validates :name, :code, :unit_price, :max_unit_limit, presence: true
  validates :unit_price, numericality: { greater_than: 100, less_than: 1000 }
  validates :max_unit_limit, numericality: { greater_than: 0, less_than: 100 }
end
