class OrderItemsController < ApplicationController
  include Sessionable
  before_action :order

  def create
    @order_item = create_order
    if @order_item.save
      session[:order_id] = @order.id
      flash[:notice] = 'Item added to cart'
    end
    redirect_to items_path
  end

  private

  def order_params
    params.permit(:item_id, :unit_price, :item_title)
  end

  def order
    @order ||= current_order
    @order.user_id = guest_user.id
    @order.user_id = current_user.id if user_signed_in?
    @order.save
  end

  def create_order
    @order.order_items.find_or_initialize_by(order_params)
  end
end
