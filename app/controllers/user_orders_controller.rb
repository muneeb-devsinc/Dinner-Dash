# frozen_string_literal: true

class UserOrdersController < ApplicationController
  include Checkoutable

  def index
    @orders = if params[:status]
                Order.where(user_id: current_user.id).show_by_status(params[:status]).order(:id)
              else
                Order.where(user_id: current_user.id).not_in_progress.order(:id)
              end
    authorize @orders, policy_class: UserOrderPolicy
  end

  def show
    authorize order, policy_class: UserOrderPolicy
  end

  def update
    if user_signed_in?
      checkout
      redirect_to items_path
    else
      flash[:alert] = 'User must be logged in to checkout'
      session[:checkout] = true
      redirect_to user_session_path
    end
  end

  private

  def order
    @order ||= Order.find(params[:id])
  end
end
