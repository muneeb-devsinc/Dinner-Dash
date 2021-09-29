class OrdersController < ApplicationController
  def index
    @orders = Order.all_orders.order_order
    @orders = Order.ordered.order_order if params[:status] == 'ordered'
    @orders = Order.paid.order_order if params[:status] == 'paid'
    @orders = Order.completed.order_order if params[:status] == 'completed'
    @orders = Order.cancelled.order_order if params[:status] == 'cancelled'
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    flash[:notice] = 'Order Updated Successfully' if @order.update(status: params[:status])
    redirect_to orders_path
  end
end
