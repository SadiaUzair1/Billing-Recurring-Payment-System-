class PaymentsController < ApplicationController
  before_action :set_plan
  before_action :set_user, only: %i[create]

  def create
    byebug
    @billing_day = Date.today
    @payment = Payment.create(plan_id: @plan.id, payment: @plan.monthly_fee,
                              billing_day: @billing_day, user_id: @user.id)
    redirect_to user_plans_url
  end

  private

  def set_plan
    @plan = Plan.all
  end

  def set_user
    @user = current_user
  end
end
