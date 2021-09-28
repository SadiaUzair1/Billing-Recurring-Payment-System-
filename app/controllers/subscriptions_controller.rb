# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @subscriptions = Subscription.all
  end

  def create
    plan = Plan.find_by(id: params[:plan_id])
    user = User.find_by(id: params[:user_id])
    @usages = Usage.joins(:subscription).where('subscriptions.user_id = ?', user.id)
    @price_for_extra_units = 0
    features_and_unit_price
    @session = CheckoutService.new({ plan: plan,
                                     user: user, used_units: @price_for_extra_units,
                                     url: users_url }).call

    respond_to do |format|
      format.js
    end
  end

  private

  def features_and_unit_price
    @usages.each do |usage|
      features = usage.feature_id
      @feature = Feature.find_by(id: features)
      check_units
    end
  end

  def check_units
    return unless usage.used_units < @feature.max_unit_limit

    extra_used_units = usage.used_units - @feature.max_unit_limit
    @price_for_extra_units += extra_used_units * @feature.unit_price
  end
end
