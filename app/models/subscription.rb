<<<<<<< HEAD
# frozen_string_literal: true

=======

# frozen_string_literal: true


>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
class Subscription < ApplicationRecord
  belongs_to :plan
  belongs_to :user

<<<<<<< HEAD
  has_many :usages, dependent: :destroy

  has_many :payments, dependent: :destroy

  validates :status, presence: true

  enum status: { subscribed: 1, unsubscribed: 0 }
=======
  validates :user_id, :plan_id, presence: true
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
end
