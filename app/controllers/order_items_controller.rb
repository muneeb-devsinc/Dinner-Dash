class OrderItemsController < ApplicationController
  include Sessionable
  before_action :order

  def create
    @order_item = create_order
    @order_item.increment!(:quantity)
    @order.user_id = current_user.id if user_signed_in?
    flash[:notice] = 'Item added to cart' if @order_item.save
    session[:order_id] = @order.id
    redirect_to items_path
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
  end

  private

  def order_params
    params.require(:order_item).permit(:item_id, :quantity, :status)
  end

  def order
    @order ||= current_order
    @order.user_id = guest_user.id
  end

  def create_order
    @order.order_items.find_or_initialize_by(item_id: params[:item_id], unit_price: params[:unit_price], item_title: params[:item_title])
  end
end
