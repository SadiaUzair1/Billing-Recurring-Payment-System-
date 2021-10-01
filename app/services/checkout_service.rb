# frozen_string_literal: true

class CheckoutService
  def initialize(params)
    @plan                     = params[:plan]
    @user                     = params[:user]
    @url                      = params[:url]
  end

  def call
    additional_amount = @user.calculate_exceeded_units_price
    total_amount = (@plan.monthly_fee + additional_amount).to_i
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @plan.name,
                                                    amount: total_amount,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: @url,
                                                  cancel_url: @url
                                                })
    add_subscription_and_payment
    add_usage
    @session
  end

  def add_subscription_and_payment
    subscriptions = @user.subscriptions.where(plan_id: @plan.id)
    if subscriptions.count == 1
      payment = subscriptions.payments.create(user_id: @user.id, payment: @plan.monthly_fee,
                                              plan_id: @plan.id, payment_date: Time.zone.today)
    else
      subscriptions.each do |subscription|
        payment = subscription.payments.create(user_id: @user.id, payment: @plan.monthly_fee,
                                               plan_id: @plan.id, payment_date: Time.zone.today)
      end
    end
  end

  def add_usage
    byebug
    features = @plan.features
    features.each do |feature|
      @usage = @user.usages.find_or_initialize_by(plan_id: @plan.id,
                                                  feature_id: feature.id,
                                                  used_units: feature.max_unit_limit)
    end
  end
end
