# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :subscriptions, dependent: nil

  has_many :features, dependent: :destroy

  has_many :payments_and_plans_ids, dependent: nil

  has_many :users, through: :subscriptions

  validates :name, presence: true
end
