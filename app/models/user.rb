# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions
<<<<<<< HEAD
=======
  has_many :payments, dependent: :destroy
  has_many :plan_usages, dependent: :destroy
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
