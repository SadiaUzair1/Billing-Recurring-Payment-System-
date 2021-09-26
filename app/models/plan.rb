# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  has_many :features, dependent: :destroy

  has_many :users, through: :subscriptions

  validates :name, :monthly_fee, presence: true
  validates :monthly_fee, numericality: { greater_than: 0 }
end
