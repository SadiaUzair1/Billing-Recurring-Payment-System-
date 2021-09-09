class PlansController < ApplicationController
  before_action :set_plan, only: %i[index]
  before_action :find_current_plan, only: %i[destroy]

  def index
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    respond_to do |format|
      if @plan.save
        format.html { redirect_to plans_path, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    binding.pry
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plan_url, notice: "Feature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def find_current_plan
    @plan = Plan.find(params[:id])
  end

  def set_plan
    @plan = Plan.all
  end

  def plan_params
    params.require(:plan).permit(:name, :plan_id)
  end
end
