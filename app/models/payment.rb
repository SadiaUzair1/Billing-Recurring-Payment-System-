class Payment < ApplicationRecord
  has_and_belongs_to_many :plans
  belongs_to :user
end
