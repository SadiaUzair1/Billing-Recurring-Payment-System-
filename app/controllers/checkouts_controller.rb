# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_plan_amount, only: [:create]
  before_action :set_plans, only: %i[add_subscriptions_and_payments add_plan_usage]
  after_action :add_subscriptions_and_payments, :add_plan_usage, only: [:create]

  def create
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: 'AMOUNT',
                                                    amount: @amount,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: users_url,
                                                  cancel_url: users_url
                                                })
    respond_to do |format|
      format.js
    end
  end

  private

  def add_subscriptions_and_payments
    @user = current_user
    plans_count = @plan_ids.count
    @billing_day = Time.zone.today
    if plans_count > 1 && @plans_ids.nil?
      @plan_ids.each do |plan_id|
        @plan = Plan.find(plan_id)
        create_subscription_and_Payment(@plan, @user)
      end
    elsif plans_count == 1
      @plan = Plan.find(@plan_ids[0])
      create_subscription_and_Payment(@plan, @user)

    else
      redirect_to users_url, notice: 'Transaction failed'
    end
  end

  def create_subscription_and_payment(plan, user)
    @subscription = Subscription.create(plan_id: plan.id, user_id: user.id)
    @payment = Payment.create(payment: plan.monthly_fee,
                              billing_day: billing_day, user_id: user.id)
  end

  def add_plan_usage
    @user = User.find(params[:user_id])
    plans_count = @plan_ids.count
    return unless plans_count.positive? && @plan_ids.nil?

    if plans_count == 1
      @plan = Plan.find(@plan_ids[0])
      @features = @plan.features
      add_feature(@features)
    else
      @plan_ids.each do |plan_id|
        @plan = Plan.find(plan_id)
        @features = @plan.features
        add_feature(@features)
      end
    end
  end

  def add_feature(_features)
    @features.each do |feature|
      @plan_usage = PlanUsage.create(user_id: @user.id, users_name: @user.name, plan_name: @plan.name,
                                     features_name: feature.name, amount: feature.total_amount,
                                     max_unit_limit: feature.max_unit_limit,
                                     increased_units: feature.max_unit_limit)
    end
  end

  def set_plan_amount
    @plan_ids = params[:selected_plans]
    @amount = 0
    @plan_ids.each do |plan_id|
      @plan_id = Plan.find(plan_id)
      @amount += @plan_id.monthly_fee
    end
  end

  def set_plans
    @plan_ids = params[:selected_plans]
  end
end
