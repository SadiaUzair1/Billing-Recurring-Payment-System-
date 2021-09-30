# frozen_string_literal: true

class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :set_user, only: %i[index destroy search]
=======
  before_action :set_user, only: %i[index destroy]
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
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
   @user = User.find_by(id: params[:id])
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
   @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_url if @user.destroy
  end

  def charge_account
    users = User.all.where(:user_type, 'buyer')
    users.each do |user|
      PaymentMailer.with(user: user).payment_reminder.deliver_now
    end
    redirect_to users_path
  end

  def search
    authorize @user
    @users = User.where('email ILIKE?', "%#{params[:q]}%")
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :user_type, :name)
  end
end
