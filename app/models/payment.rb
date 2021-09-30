# frozen_string_literal: true

class Payment < ApplicationRecord
<<<<<<< HEAD
  belongs_to :subscription

  validates :payment, presence: true
=======
  belongs_to :user

  has_many :payments_and_plans_ids, dependent: :destroy

  has_many :plans, through: :payments_and_plans_ids

  validates :user_id, :payment, :billing_day, presence: true
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
end
