# frozen_string_literal: true

class PAymentMailer < ApplicationMailer
  def payment_reminder
    @user = params[:user]
    mail(to: @user.email, subject: 'Payment for subscription')
  end
end
