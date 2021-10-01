# frozen_string_literal: true

class Usage < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature

  def exceeded_max_units?
    feature.max_unit_limit > used_units
  end

  def find_feature
    Feature.find_by(id: feature_id)
  end

  def find_plan
    Plan.find_by(id: plan_id)
  end
end
