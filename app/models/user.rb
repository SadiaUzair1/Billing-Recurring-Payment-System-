class User < ApplicationRecord
  has_many :subscriptions
  has_many :plans, through: :subscriptions
  has_many :payments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
