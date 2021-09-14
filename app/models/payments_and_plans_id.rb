class PaymentsAndPlansId < ApplicationRecord
  belongs_to :plan
  belongs_to :payment

  validates :plan_id, presence: true
  validates :payment_id, presence: true
end
