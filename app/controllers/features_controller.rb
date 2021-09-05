
class FeaturesController < ApplicationController

  def add_features
  end

  def index
  end

  def new
    @feature = Feature.new(feature_params)
  end

  def show
    @features = Feature.all
  end

  def create
    @feature = Feature.new(feature_params)
    if @feature.save
      redirect_to @feature
    else
      render 'new'
    end
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit)
  end
end
