# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_plan,  only: [:create]

  def index
    @payments = Payment.all
  end

  def create
    @user = current_user
    @subscription = Subscription.find_or_create_by(plan_id: @plan.id,
                                                   user_id: @user.id)
    return flash.alert = 'Already Subscribed.' if @subscription.subscribed?

    data_entry_in_payments
    @session = CheckoutService.new({ plan: @plan,
                                     user: @user, used_units: 0, url: users_url }).call

    respond_to do |format|
      format.js
    end
    add_usage
  end

  private

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end

  def data_entry_in_payments
    @subscription.payments.create(user_id: @user.id, payment: @plan.monthly_fee,
                                  plan_id: @plan.id, payment_date: Time.zone.today)
  end

  def add_usage
    features = @plan.features
    features.each do |feature|
      @usage = @subscription.usages.find_or_create_by(user_id: @user.id, plan_id: @plan.id,
                                                      feature_id: feature.id,
                                                      used_units: feature.max_unit_limit)
    end
    @user = current_user
    CheckoutMailer.with(user: @user).subscription_confirmation.deliver_now
  end
end
