class PlanUsagesController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    @plan_usage = @user.plans
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
