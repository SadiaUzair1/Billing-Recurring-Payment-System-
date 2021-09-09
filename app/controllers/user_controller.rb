class UserController < ApplicationController
  def index
  end

  def show
  end

  def about
  end

  def add_buyer
  end

  def add_plan
  end

  def add_features
  end

  private
  def plans_params
    params.require(:plan).permit!
  end
end
