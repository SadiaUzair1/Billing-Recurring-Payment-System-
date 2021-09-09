class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  belongs_to :plan_usage_table, optional: true
end
