# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  validates :user_id, :plan_id, presence: true
end
