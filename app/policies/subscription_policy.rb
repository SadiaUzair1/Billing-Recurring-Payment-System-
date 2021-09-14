class SubscruptionPolicy < ApplicationPolicy
  def create?
    buyer?
  end
end
