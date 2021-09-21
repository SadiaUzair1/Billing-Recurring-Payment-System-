# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_plan, :set_user
  before_action :set_feature, only: %i[destroy update]
  after_action :set_plan_amount, only: %i[create update destroy]
  after_action :update_plan_usage, only: %i[update]

  def index
    @features = @plan.features
  end

  def new
    @features = @plan.features.new
    authorize @features
  end

  def edit
    @features = @plan.features.find(params[:id])
  end

  def create
    feature_param = feature_params
    feature_param[:total_amount] = feature_params[:max_unit_limit].to_i * feature_params[:unit_price].to_i
    @feature = @plan.features.new(feature_param)
    save_feature(@feature)
  end

  def update
    @feature_param = feature_params
    @feature_param[:total_amount] = feature_params[:max_unit_limit].to_i * feature_params[:unit_price].to_i

    respond_to do |format|
      if @feature.update(@feature_param)
        format.html { redirect_to user_plan_features_path, notice: 'Feature is successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @feature
    redirect_to user_plan_features_path(@user, @plan) if @feature.destroy
  end

  def save_feature(feature)
    respond_to do |format|
      if feature.save
        format.html { redirect_to user_plan_features_path(@user, @plan), notice: 'Feature was successfully updated' }
      else
        format.html do
          redirect_to user_plan_features_path(@user, @plan),
                      notice: 'Feature was not  updated', status: :unprocessable_entity
        end
      end
    end
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

  def update_plan_usage
    plan_usages = PlanUsage.all
    plan_usages.each do |plan_usage|
      plan_usage.update(amount: @feature_param[:total_amount]) if plan_usage.features_name == @feature_param[:name]
    end
  end

  def feature_params
    params.require(:feature).permit(:feature_id, :name, :code, :unit_price, :max_unit_limit)
  end
end
