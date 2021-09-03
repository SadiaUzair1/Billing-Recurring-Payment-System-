class Transaction < ApplicationRecord
  has_and_belongs_to_many :plans
  belongs_to :users
end
