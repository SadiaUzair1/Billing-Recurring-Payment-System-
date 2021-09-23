# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :subscription

  validates :user_id, :payment, presence: true
end
