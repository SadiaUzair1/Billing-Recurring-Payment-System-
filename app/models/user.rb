# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
