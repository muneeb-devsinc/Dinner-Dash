class OrdersController < ApplicationController
  def index
    @orders = params[:status] ? Order.show_by_status(order_params[:status]).order_order : Order.all_orders.order_order
  end

  def show
    @order = Order.find(order_params[:id])
  end

  def update
    @order = Order.find(order_params[:id])
    flash[:notice] = 'Order Updated Successfully' if @order.update(order_params)
    redirect_to orders_path
  end

  private

  def order_params
    params.permit(:id, :status)
  end
end
