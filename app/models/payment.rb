# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :subscription

  validates :payment, presence: true

end
