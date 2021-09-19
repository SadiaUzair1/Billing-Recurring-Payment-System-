# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_plan_amount, only: [:create]
  before_action :set_plans, only: %i[add_subscriptions_and_payments add_plan_usage]
  after_action :add_subscriptions_and_payments, :add_plan_usage, only: [:create]
  after_action :email_vreifiction, only: [:create]

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

  def set_plan_amount
    @plan_ids = params[:selected_plans]
    @amount = Plan.where(id: @plan_ids).sum(:monthly_fee)
  end

  def add_subscriptions_and_payments
    @user = current_user
    plans_count = @plans_ids.nil? ? @plan_ids.count : 0
    if plans_count > 1
      @plan_ids.each do |plan_id|
        @plan = Plan.find(plan_id)
        data_entery_subscription_and_payment(@plan, @user)
      end
    elsif plans_count == 1
      @plan = Plan.find_by(id: @plan_ids[0])
      data_entery_subscription_and_payment(@plan, @user)
    else
      redirect_to users_url, notice: 'Transaction failed'
    end
  end

  def data_entery_subscription_and_payment(plan, user)
    @billing_day = Time.zone.today
    @subscription = Subscription.create(plan_id: plan.id, user_id: user.id, status: 1)
    @payment = plan.payments.create(payment: plan.monthly_fee, plan_id: plan.id,
                                    billing_day: Time.zone.today, user_id: user.id, status: 1,
                                    next_billing_day: Time.zone.today + 1.month)
  end

  def add_plan_usage
    @user = User.find(params[:user_id])
    plans_count = @plan_ids.count
    return unless plans_count.positive? && !@plan_ids.nil?

    if plans_count == 1

      @plan = Plan.find(@plan_ids[0])
      @features = @plan.features
      data_entery_in_plan_usage(@features)
    else
      @plan_ids.each do |plan_id|
        @plan = Plan.find(plan_id)
        @features = @plan.features
        data_entery_in_plan_usage(@features)
      end
    end
  end

  def data_entery_in_plan_usage(_features)
    @features.each do |feature|
      @plan_usage = PlanUsage.create(user_id: @user.id, users_name: @user.name, plan_name: @plan.name,
                                     features_name: feature.name, amount: feature.total_amount,
                                     max_unit_limit: feature.max_unit_limit,
                                     increased_units: feature.max_unit_limit)
    end
  end

  def email_vreifiction
    @user = current_user
    CheckoutMailer.with(user: @user).subscription_confirmation.deliver_now
  end
end
