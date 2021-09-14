class FeaturePolicy < ApplicationPolicy
  def new?
    admin?
  end

  def destroy?
    admin?
  end


end
