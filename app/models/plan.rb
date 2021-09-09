class Plan < ApplicationRecord
  has_many :features, dependent: :destroy
  has_and_belongs_to_many :payments
  has_many :users, through: :subscriptions
  belongs_to :plan_usage_table, optional: true
end
