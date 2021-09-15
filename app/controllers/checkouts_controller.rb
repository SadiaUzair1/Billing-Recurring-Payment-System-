# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_user, only: [:create]

  def payment;  end

  # def create
  #   @session =
  #     Stripe::Checkout::Session.create({
  #       success_url: user_plans_url(@user.id),
  #       cancel_url: users_url,
  #       payment_method_types: ['card'],
  #       line_items: [
  #         { price: 'price_1JZXtkEFRIpd3guk6DQotq25', quantity: 1 }
  #       ],
  #       mode: 'payment'
  #          })
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def create
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],

      line_items: [{
        name: 'AMOUNT',
        amount: @user.plans.sum(:monthly_fee),
        currency: 'usd',
        quantity: 1
      }],

      mode: 'payment',
      success_url: user_plans_url(@user.id),
      cancel_url: users_url
})
    respond_to do |format|
      format.js
    end
  end

  private

  def set_user
    @user = current_user
  end
 end
