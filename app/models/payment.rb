# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :subscription

  validates :payment, presence: true

  def find_plan
    Plan.find_by(id: plan_id)
  end

  def find_user
    User.find_by(id: user_id)
  end
end
