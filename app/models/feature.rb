class Feature < ApplicationRecord
  belongs_to :plan

  validates :name, presence: true
  validates :code, presence: true
  validates :unit_price, presence: true
  validates :max_unit_limit, presence: true
end
