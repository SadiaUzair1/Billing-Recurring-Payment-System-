class Payment < ApplicationRecord
  belongs_to :user
  has_many :payments_and_plans_ids

  validates :user_id, presence: true
  validates :payment, presence: true
  validates :billing_day, presence: true
end
