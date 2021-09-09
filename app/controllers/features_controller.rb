class FeaturesController < ApplicationController
  before_action :set_plan
  before_action :set_features_id, only: %i[destroy]
  after_action :set_plan_amount, only: %i[create destroy]

  def index
    @features = @plan.features
  end

  def new
    @features = @plan.features.new
  end

  def show
  end

  def create
    @feature = @plan.features.new(feature_params)
    respond_to do |format|
      if @feature.save
        format.html { redirect_to plan_feature_path(@plan, @feature), notice: 'Feature was successfully updated' }
        format.json { render :show, status: :ok, location: @feature }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feature.destroy
    redirect_to plan_features_path(@plan)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_plan_amount
    @plan_monthly_fee = @plan.features.sum(:unit_price)
    @plan.update(monthly_fee: @plan_monthly_fee)
  end

  def set_feature
    @feature = @plan.features.find(params[:id])
  end

  def set_features_id
    @feature = Feature.find(params[:id])
  end
  def feature_params
    params.require(:feature).permit(:feature_id, :name, :code, :unit_price, :max_unit_limit)
  end
end
