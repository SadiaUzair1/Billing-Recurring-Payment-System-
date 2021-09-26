# frozen_string_literal: true

class CheckoutService
  def initialize(params)
    @plan             = params[:plan]
    @user             = params[:user]
    @used_units       = params[:used_units]
    @url              = params[:url]
  end

  def call
    amount = (@plan.monthly_fee + @used_units).to_i
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @plan.name,
                                                    amount: amount,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: @url,
                                                  cancel_url: @url
                                                })
  end
end
