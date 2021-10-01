# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @subscriptions = Subscription.all
  end

  def create
    plan = Plan.find_by(id: params[:plan_id])
    user = User.find_by(id: params[:user_id])
    @session = CheckoutService.new({ plan: plan, user: user, url: users_url }).call

    respond_to do |format|
      format.js
    end
  end
end
