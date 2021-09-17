# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def show; end

  def destroy; end
end
