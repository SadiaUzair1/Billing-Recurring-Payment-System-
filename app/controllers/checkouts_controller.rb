# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_plan,  only: [:create]

  def index
    @payments = Payment.all
  end

  def create
    @user = current_user
    @subscription = Subscription.find_or_initialize_by(plan_id: @plan.id,
                                                      user_id: @user.id, status: 1)
    
    return render 'error' unless @subscription.save
    

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
    payment = @subscription.payments.new(user_id: @user.id, payment: @plan.monthly_fee,
                                  plan_id: @plan.id, payment_date: Time.zone.today)
    return  flash.alert = 'Transaction Done.' if payment.save
  end

  def add_usage
    features = @plan.features
    features.each do |feature|
      @usage = @subscription.usages.find_or_initialize_by(plan_id: @plan.id,
                                                      feature_id: feature.id,
                                                      used_units: feature.max_unit_limit)
    end
     if @usage.save
      @user = current_user
      CheckoutMailer.with(user: @user).subscription_confirmation.deliver_now
     else
      flash.alert = 'Transaction failed.'
     end
  end
end
