# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  include Sessionable
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :display) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :display) }
  end

  private

  def user_not_authorized
    flash[:alert] = 'Unauthorized Action'
    redirect_to(request.referer || root_path)
  end

  def after_sign_in_path_for(_resource)
    cart_path
  end
end
