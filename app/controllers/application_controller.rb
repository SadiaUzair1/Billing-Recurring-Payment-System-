# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[name userType password email])
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action!'
    redirect_to(request.referer || root_path)
  end
end
