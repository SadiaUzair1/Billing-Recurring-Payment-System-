# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_plan, only: [:create]
  after_action :add_subscriptions_and_payments, only: [:create]

  def index
    @payments = Payment.all
  end

  def create
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @plan.name,
                                                    amount: @plan.monthly_fee.to_i,
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

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end

  def add_subscriptions_and_payments
    @user = current_user
    check_subscription
    return unless @subscription.subscribed?

    @subscription.payments.create(user_id: @user.id, payment: @plan.monthly_fee,
                                  plan_id: @plan.id, payment_date: Time.zone.today)

    add_usage
  end

  def check_subscription
    @subscription = if Subscription.where(plan_id: @plan.id).exists? &&
                       Subscription.where(user_id: @user.id).exists?
                      Subscription.find_by(plan_id: @plan.id, user_id: @user.id)
                    else
                      @user.subscriptions.create(plan_id: @plan.id, status: 1)
                    end
  end

  def add_usage
    @user = current_user
    features = @plan.features
    features.each do |feature|
      next if Usage.where(plan_id: @plan.id).exists? &&
              Usage.where(feature_id: feature.id).exists?

      @usage = @subscription.usages.create(user_id: @user.id, plan_id: @plan.id,
                                           feature_id: feature.id,
                                           used_units: feature.max_unit_limit)
    end
    email_verifiction
  end

  def email_verifiction
    @user = current_user
    CheckoutMailer.with(user: @user).subscription_confirmation.deliver_now
  end
end
