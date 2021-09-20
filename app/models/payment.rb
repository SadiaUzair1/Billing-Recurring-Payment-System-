# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :user

  has_many :payments_and_plans_ids, dependent: nil

  validates :user_id, :payment, :billing_day, presence: true
end
