# frozen_string_literal: true

class SubscruptionPolicy < ApplicationPolicy
  def create?
    buyer?
  end
end
