class Subscription < ApplicationRecord
  belongs_to :plans
  belongs_to :users
end
