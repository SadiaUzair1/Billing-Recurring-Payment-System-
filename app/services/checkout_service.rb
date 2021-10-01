# frozen_string_literal: true

class CheckoutService
  def initialize(params)
    @plan = params[:plan]
    @user = params[:user]
    @url = params[:url]
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
    ActiveRecord::Base.transaction do
      add_subscription_and_payment
      add_usage
    end
  rescue ActiveRecord::RecordInvalid
    @session
  end

  def add_subscription_and_payment
    subscriptions = @user.subscriptions.where(plan_id: @plan.id)
    if subscriptions.count == 1
      entry_in_payment_table(subscriptions.first)
    else
      subscriptions.each do |subscription|
        entry_in_payment_table(subscription)
      end
    end
  end

  def entry_in_payment_table(subscription)
    subscription = subscription.payments.new(user_id: @user.id, payment: @plan.monthly_fee,
                                             plan_id: @plan.id, payment_date: Time.zone.today)
    return raise ActiveRecord::Rollback, ' Transaction failed ' unless subscription.save
  end

  def add_usage
    features = @plan.features
    features.each do |feature|
      @usage = @user.usages.find_or_initialize_by(plan_id: @plan.id,
                                                  feature_id: feature.id,
                                                  used_units: feature.max_unit_limit)
      return raise ActiveRecord::Rollback, ' Transaction failed ' unless @usage.save
    end
  end
end
