# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def new?
    admin?
  end

  def index?
    admin?
  end

  def destroy?
    admin?
  end
end
