class Plan < ApplicationRecord
  has_many :features, dependent: :destroy
  has_and_belongs_to_many :transactions
  has_many :users, through: :subscriptions
  belongs_to :plan_usage_tables
end
