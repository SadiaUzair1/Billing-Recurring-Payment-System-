class Feature < ApplicationRecord
  belongs_to :plan

  validates :name, :code, :unit_price, :max_unit_limit, presence: true
  validates :code, uniqueness: true
  validates :unit_price, numericality: true
  validates :max_unit_limit, numericality: true
end
