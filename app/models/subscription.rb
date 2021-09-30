# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  has_many :usages, dependent: :destroy

  has_many :payments, dependent: :destroy

  validates :status, presence: true

  enum status: { subscribed: 1, unsubscribed: 0 }

end
