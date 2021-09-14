class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
    authorize @user
  end

  def show
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.with(user: @user).registration_confirmation.deliver_later
        format.html { redirect_to main_index_path(@plan, @user), notice: 'user was successfully updated' }
        format.json { render :show, status: :ok, location: @user }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :userType)
  end
end
