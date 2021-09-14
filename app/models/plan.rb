class Plan < ApplicationRecord
  has_many :features, dependent: :destroy
  has_many :payments_and_plans_ids
  has_many :users, through: :subscriptions

  validates :name, presence: true
end
