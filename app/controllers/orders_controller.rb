# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = if params[:status]
                Order.show_by_status(order_params[:status]).order(id: :desc)
              else
                Order.not_in_progress.order(id: :desc)
              end.page(params[:page]).per(5)
    authorize @orders, policy_class: OrderPolicy
  end

  def show
    authorize order, policy_class: OrderPolicy
    @order_items = @order.order_items.includes(:item)
  end

  def update
    authorize order, policy_class: OrderPolicy
    flash[:notice] = 'Order Updated Successfully' if @order.update!(order_params)
    redirect_to orders_path
  end

  private

  def order_params
    params.permit(:id, :status)
  end

  def order
    @order ||= Order.find(order_params[:id])
  end
end
