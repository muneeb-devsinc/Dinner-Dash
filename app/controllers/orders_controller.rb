# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = params[:status] ? Order.show_by_status(order_params[:status]).order_order : Order.all_orders.order_order
    authorize @orders, policy_class: OrderPolicy
  end

  def show
    @order = Order.find(order_params[:id])
    authorize @order, policy_class: OrderPolicy
  end

  def update
    @order = Order.find(order_params[:id])
    authorize @order, policy_class: OrderPolicy
    flash[:notice] = 'Order Updated Successfully' if @order.update(order_params)
    redirect_to orders_path
  end

  private

  def order_params
    params.permit(:id, :status)
  end
end
