# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_plan, :set_user
  before_action :set_feature, only: %i[destroy update edit]

  def index
    @features = @plan.features
  end

  def new
    @features = @plan.features.new
    authorize @features
  end

  def edit; end

  def create
    @feature = @plan.features.new(feature_params)
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
      if @features.update(feature_params)
        format.html { redirect_to user_plan_features_path, notice: 'Feature is successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @features
    redirect_to user_plan_features_path(@user, @plan) if @feature.destroy
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_feature
    @features = @plan.features.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit)
  end
end
