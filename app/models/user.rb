# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions
  has_many :usages, through: :subscriptions
  has_one_attached :image, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  enum user_type: { buyer: 0, admin: 1 }

  def calculate_exceeded_units_price
    additional_units_price = 0
    usages.each do |usage|
      feature = usage.feature
      next if usage.exceeded_max_units?

      extra_used_units = usage.used_units - feature.max_unit_limit
      additional_units_price += extra_used_units * feature.unit_price
    end
    additional_units_price
  end
end
