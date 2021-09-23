# frozen_string_literal: true

class CheckoutMailer < ApplicationMailer
  def subscription_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: 'Subscribed!')
  end
end
