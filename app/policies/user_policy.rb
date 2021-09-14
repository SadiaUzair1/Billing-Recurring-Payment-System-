class UserPolicy < ApplicationPolicy
  def new?
    admin?
  end
end
