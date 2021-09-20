# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @user = current_user
    @subscriptions = Subscription.all

    @plan_usage = @user.plan_usages.all
    byebug
  end

  def show; end

  def destroy; end
end
