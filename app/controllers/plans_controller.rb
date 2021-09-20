# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :set_plan, only: [:index]
  before_action :find_current_plan, only: [:destroy]
  before_action :set_user, only: %i[index new create]

  def index; end

  def show; end

  def new
    @plan = Plan.new
    authorize @plan
  end

  def create
    @plan = Plan.new(plan_params)
    respond_to do |format|
      if @plan.save
        format.html { redirect_to user_plans_path, notice: 'Plan was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @plan
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to user_plans_url, notice: 'Feature was successfully destroyed.' }
    end
  end

  private

  def find_current_plan
    @plan = Plan.find(params[:id])
  end

  def set_plan
    @plan = Plan.all
  end

  def set_user
    @user = current_user
  end

  def set_subscription; end

  def plan_params
    params.require(:plan).permit(:name, :plan_id, :monthly_fee)
  end
end
