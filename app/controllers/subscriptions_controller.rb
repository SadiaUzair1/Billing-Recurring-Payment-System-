# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
  end
end
