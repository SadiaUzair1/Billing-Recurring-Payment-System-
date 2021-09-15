# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def new?
    admin?
  end

  def destroy?
    admin?
  end
end
