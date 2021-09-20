# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_plan, :set_user
  before_action :set_feature, only: %i[destroy update]
  after_action :set_plan_amount, only: %i[create destroy]

  def index
    @features = @plan.features
  end

  def new
    @features = @plan.features.new
    authorize @features
  end

  def show; end

  def edit
    @features = @plan.features.find(params[:id])
  end

  def create
    byebug
    feature_param =  feature_params
    feature_param[:total_amount] =  feature_params[:max_unit_limit].to_i * feature_params[:unit_price].to_i
    @feature = @plan.features.new(feature_param)
    respond_to do |format|
      if @feature.save
        format.html { redirect_to user_plan_features_path(@user, @plan), notice: 'Feature was successfully updated' }
      else
        format.html do
          redirect_to user_plan_features_path(@user, @plan),
                      notice: 'Feature was not  updated', status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to user_plan_features_path, notice: "Feature is successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @feature
    @feature.destroy
    redirect_to user_plan_features_path(@user, @plan)
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_plan_amount
     @plan_monthly_fee = @plan.features.sum(:total_amount)
     @plan.update(monthly_fee: @plan_monthly_fee)
  end

  def set_feature
    @feature = @plan.features.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def feature_params
    params.require(:feature).permit(:feature_id, :name, :code, :unit_price, :max_unit_limit)
  end
end
