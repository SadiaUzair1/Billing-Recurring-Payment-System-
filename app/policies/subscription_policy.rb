# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def create?
    buyer?
  end
end
