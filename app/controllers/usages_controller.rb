# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :set_user, only: %i[index edit update]
  before_action :set_usage, only: %i[index edit update]

  def index; end

  def edit
    @plan = Usage.find_by(id: params[:id])
  end

  def update
    respond_to do |format|
      if @usage.update(usage_params)
        format.html { redirect_to users_path, notice: 'Limit for user is increased successfully.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_usage
    @usage = Usage.find_by(id: params[:id])
  end

  def usage_params
    params.require(:usage).permit(:used_units)
  end
end
