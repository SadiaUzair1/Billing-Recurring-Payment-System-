# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions
  has_many :payments, dependent: :destroy
  has_many :plan_usages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
