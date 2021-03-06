# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def registration_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: 'Account Registered')
  end
end
