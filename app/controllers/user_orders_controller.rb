# frozen_string_literal: true

class UserOrdersController < ApplicationController
  include Checkoutable

  before_action :set_order, only: :show
  def index
    authorize @orders, policy_class: UserOrderPolicy
    @orders = if params[:status]
                Order.where(user_id: current_user.id).show_by_status(params[:status]).order(:id)
              else
                Order.where(user_id: current_user.id).not_in_progress.order(:id)
              end
  end

  def show
    authorize @order, policy_class: UserOrderPolicy
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

  def set_order
    @order = Order.find(params[:id])
  end
end
