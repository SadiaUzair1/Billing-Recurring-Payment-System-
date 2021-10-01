# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[index destroy search]

  def index
    authorize @user
    @users = User.all
    @plans = Plan.all
  end

  def charge_account
    users = User.all.where(user_type: 0)
    users.each do |user|
      PaymentMailer.with(user: user).payment_reminder.deliver_now
    end
    redirect_to users_path
  end

  def search
    authorize @user
    @users = User.where('email ILIKE?', "%#{params[:q]}%")
    @plans = Plan.all
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :user_type, :name)
  end
end
