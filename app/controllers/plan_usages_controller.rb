# frozen_string_literal: true

class PlanUsagesController < ApplicationController
  before_action :set_user, only: %i[index edit update_buyers_payment]
  before_action :set_user_usage, only: [:update]
  after_action :update_buyers_payment, only: [:update]

  def index
    @usage = @user.usages
  end

  def edit
    @usage = @user.usages.find(params[:id])
  end

  def update
    usage_param = usage_params
    usage_param[:amount] = usage_param[:increased_units].to_i * usage_param[:amount].to_i
    respond_to do |format|
      if @usage.update(usage_param)
        format.html { redirect_to user_usages_path, notice: 'Limit for user is increased successfully.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update_buyers_payment
    usage_param = usage_params
    usage_param[:amount] = usage_param[:increased_units].to_i * usage_param[:amount].to_i
    plan = Plan.find_by(name: usage_param[:plan_name])
    plan_id = plan.id
    @user.plans[plan_id].payments.update(payment: usage_param[:amount], status: 0)
  end

  private

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_user_usage
    @user = User.find_by(id: params[:user_id])
    @usage = @user.usages.find(params[:id])
  end

  def set_usage
    @usage = Usage.find_by(id: params[:user_id])
  end

  def usage_params
    params.require(:usage).permit(:amount, :increased_units, :plan_name)
  end
end
