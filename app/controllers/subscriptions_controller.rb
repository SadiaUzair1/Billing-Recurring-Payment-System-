# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @user = current_user
    @subscriptions = Subscription.all
  end
end
