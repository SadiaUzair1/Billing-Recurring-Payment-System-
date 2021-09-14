class PlanPolicy < ApplicationPolicy
  def new?
    admin?
  end
  def destroy?
    admin?
  end
end
