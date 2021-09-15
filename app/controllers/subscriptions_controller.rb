# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :set_plan, :set_user
  after_action :set_payment, :set_plan_usage, only: [:create]

  def index; end

  def show; end

  def new
    @subscription = Subscription.new
  end

  def create
    binding.pry
    @subscription = Subscription.new(plan_id: @plan.id, user_id: @user.id)
    respond_to do |format|
      if @subscription.save
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy; end

  private

  def set_payment
    @payments = Payment.new
    @billing_day = Time.zone.today
    @payments.update(payment: @plan.monthly_fee,
                     billing_day: @billing_day, user_id: @user.id)
  end

  def set_plan_usage
    @plan_usage = PlanUsage.new
    @user_id = current_user.id
    @plan_name = @plan.name
    @feature = @plan.features
    @plan_usage.update(user_id: @user_id, plan_name: @plan_name)
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
