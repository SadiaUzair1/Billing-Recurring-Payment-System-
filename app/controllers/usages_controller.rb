# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_user, only: %i[index edit update]

  before_action :set_usage, only: %i[index edit update]
  def index; end

  def edit
    @plan = Usage.find(params[:id])
  end

  def update
    respond_to do |format|
      if @usage.update(usage_params)
        format.html { redirect_to users_path, notice: 'Limit for user is increased successfully.' }
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

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_usage
    @usage = Usage.find_by(id: params[:id])
  end

  def usage_params
    params.require(:usage).permit(:used_units)
  end
end
