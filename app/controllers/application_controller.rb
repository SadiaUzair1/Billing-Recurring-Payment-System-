# frozen_string_literal: true

class ApplicationController < ActionController::Base
<<<<<<< HEAD
  include Pundit
  before_action :valid_user?
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def error; end

  protected

  def valid_user?
    return if signed_in?
    return if ((controller_name == 'users') && (action_name == 'home')) ||
              ((controller_name == 'sessions') && (action_name == 'new'))

    render 'error'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[name userType password email])
  end

  private
=======
 before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password userType])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password userType])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: %i[name userType password email])
  end

 private
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action!'
    redirect_to(request.referer || root_path)
  end
end
