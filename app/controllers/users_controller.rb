# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[index destroy]
  def index
    authorize @user
    @current_user = current_user
    @user = User.all
  end

  def new
    @user = User.new
    authorize @user
  end

  def show; end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.with(user: @user).registration_confirmation.deliver_now
        format.html { redirect_to users_path, notice: 'user was successfully created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path, notice: 'User is successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @user
    @user = User.find(params[:id])
    @user.destroy
   redirect_to users_url if @user.destroy
  end

  def home; end

  def charge_account
    users = User.all

    users.each do |user|
      if user.userType != 'buyer'
        @buyer = User.find_by(id: user.id)
        PaymentMailer.with(user: @buyer).payment_reminder.deliver_now
      end
    end
    redirect_to users_path
  end

  def invite
    @user = current_user
    User.invite!(email: 'sadia.uzair@devsinc.com', name: 'sadia')
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :userType, :name)
  end
end
