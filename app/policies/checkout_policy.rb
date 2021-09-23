# frozen_string_literal: true

class CheckoutPolicy < ApplicationPolicy
  def index?
    admin?
  end
end
