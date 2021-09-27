# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  has_many :usages, dependent: :destroy

  has_many :payments, dependent: :destroy

  validates :status, presence: true

  enum status: { subscribed: 1, unsubscribed: 0 }

  # def check_subscription
  #   binding.pry
  #   @subscription = if Subscription.where(plan_id: plan.id).exists? &&
  #                      Subscription.where(user_id: user.id).exists?
  #                     find_by(plan_id: plan.id, user_id: user.id)
  #                   else
  #                     user.subscriptions.create(plan_id: plan.id, status: 1)
  #                   end
  # end
end
