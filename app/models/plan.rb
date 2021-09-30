# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  has_many :features, dependent: :destroy

<<<<<<< HEAD
  has_many :users, through: :subscriptions

  validates :name, :monthly_fee, presence: true
  validates :monthly_fee, numericality: { greater_than: 0 }
=======
  has_many :payments_and_plans_ids, dependent: :destroy

  has_many :payments, through: :payments_and_plans_ids

  has_many :users, through: :subscriptions

  validates :name, presence: true
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
end
