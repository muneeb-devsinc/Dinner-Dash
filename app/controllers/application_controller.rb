# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :set_search
  after_action :set_cart_count
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from NameError, with: :route_not_found
  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :display_name) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :display_name) }
  end

  def record_not_found
    render file: Rails.public_path.join('404.html'), status: :internal_server_error
  end

  def unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  def user_not_authorized
    flash[:alert] = 'Unauthorized Action'
    redirect_to(request.referer || root_path)
  end

  def after_sign_in_path_for(_resource)
    cart_path
  end

  def set_search
    @q = Item.ransack(params[:q])
  end

  def set_cart_count
    session[:cart_count] = Order.find_by(id: session[:order_id], status: :in_progress)&.order_items&.count.to_i
  end
end
