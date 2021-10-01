# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_plan,  only: [:create]
  before_action :check_if_already_subscribed, only: [:create]
  after_action :confirmation_email, only: [:create]

  def index
    @payments = Payment.all
  end

  def create
    @subscription = Subscription.create(plan_id: @plan.id, user_id: current_user.id, status: 1)

    @session = CheckoutService.new({ plan: @plan, user: current_user, url: users_url }).call
    respond_to do |format|
      format.js
    end
  end

  private

  def check_if_already_subscribed
    @subscription = Subscription.find_by(plan_id: @plan.id, user_id: current_user.id)
    if @subscription.present?
      flash['alert'] = 'ALREADY SUBSCRIBED'
      respond_to do |format|
        format.js { render(js: "window.location = '#{user_plans_path(current_user.id)}'") }
      end
    end
  end

  def set_plan
    @plan = Plan.find_by(id: params[:plan_id])
  end

  def confirmation_email
    CheckoutMailer.with(user: current_user).subscription_confirmation.deliver_now
  end
end
