# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :set_plan, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index new update edit create]

  def index
    @plans = Plan.all
  end

  def show; end

  def edit; end

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

  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to user_plans_path(@user), notice: 'Plan is successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @plan
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to user_plans_url, notice: 'Plan was successfully destroyed.' }
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def plan_params
    params.require(:plan).permit(:name, :monthly_fee)
  end
end
