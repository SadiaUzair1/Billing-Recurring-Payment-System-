# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def new?
    admin?
  end

  def create?
    admin?
  end

  def edit?
    admin?
  end

  def update?
    admin?
  end

 def destroy?
    admin?
  end
end
