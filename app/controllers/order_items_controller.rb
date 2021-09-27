class OrderItemsController < ApplicationController
  include Sessionable
  before_action :order
  before_action :create_order, only: :create

  def create
    @order_item = create_order
    order.user_id = current_user.id if user_signed_in?
    @order_item.save
    session[:order_id] = order.id
  end

  def update
    @order_item = order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items
  end

  def destroy
    @order_item = order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  def show
    buybug
  end

  private

  def order_params
    params.require(:order_item).permit(:item_id, :quantity, :status)
  end

  def order
    @order ||= current_order
  end

  def create_order
    order.order_items.new(item_id: params[:item_id], unit_price: params[:unit_price],item_title: params[:item_title])
  end
end
