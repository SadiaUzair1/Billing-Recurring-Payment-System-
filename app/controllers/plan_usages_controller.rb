# frozen_string_literal: true

class PlanUsagesController < ApplicationController
  before_action :set_user, only: %i[index edit update_buyers_payment]
  before_action :set_user_plan_usage, only: [:update]
  after_action :update_buyers_payment, only: [:update]

  def index
    @plan_usage = @user.plan_usages
  end

  def edit
    @plan_usage = @user.plan_usages.find(params[:id])
  end

  def update
    plan_usage_param = plan_usage_params
    plan_usage_param[:amount] = plan_usage_param[:increased_units].to_i * plan_usage_param[:amount].to_i
    respond_to do |format|
      if @plan_usage.update(plan_usage_param)
        format.html { redirect_to user_plan_usages_path, notice: 'Limit for user is increased successfully.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update_buyers_payment
    plan_usage_param = plan_usage_params
    plan_usage_param[:amount] = plan_usage_param[:increased_units].to_i * plan_usage_param[:amount].to_i
    plan = Plan.find_by(name: plan_usage_param[:plan_name])
    plan_id = plan.id
    @user.plans[plan_id].payments.update(payment: plan_usage_param[:amount], status: 0)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_plan_usage
    @user = User.find(params[:user_id])
    @plan_usage = @user.plan_usages.find(params[:id])
  end

  def set_plan_usage
    @plan_usage = PlanUsage.find(params[:user_id])
  end

  def plan_usage_params
    params.require(:plan_usage).permit(:amount, :increased_units, :plan_name)
  end
end
