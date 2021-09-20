class PlanUsage < ApplicationRecord
  validates :user_id, :plan_name, presence: true
end
