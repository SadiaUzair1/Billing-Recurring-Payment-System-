class PlanUsageTable < ApplicationRecord
  has_many :plans
  has_many :subscriptions
  has_many :users
end
