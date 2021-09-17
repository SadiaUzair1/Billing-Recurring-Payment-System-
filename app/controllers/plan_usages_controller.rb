# frozen_string_literal: true

class PlanUsagesController < ApplicationController
  before_action :set_user, only: %i[index edit]
  before_action :set_plan_usage_for_update, only: [:update]

  def index
    @plan_usage = @user.plan_usages
  end

  def edit
    @plan_usage = @user.plan_usages.find(params[:id])
  end

  def update
    respond_to do |format|
      if @plan_usage.update(plan_usage_params)
        format.html { redirect_to user_plan_usages_path, notice: 'Limit for user is increased successfully.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_plan_usage_for_update
    @user = User.find(params[:user_id])
    @plan_usage = @user.plan_usages.find(params[:id])
  end

  def set_plan_usage
    @plan_usage = PlanUsage.find(params[:user_id])
  end

  def plan_usage_params
    params.require(:plan_usage).permit(:increased_units)
  end
end
