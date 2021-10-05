# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :order

  def create
    @order_item = create_order
    if @order_item.save!
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
    @order.user_id = user_signed_in? ? current_user.id : guest_user.id
    @order.save!
  end

  def create_order
    @order.order_items.find_or_initialize_by(order_params)
  end

  def current_order
    if Order.find_by(id: session[:order_id], status: :in_progress).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id], status: :in_progress)
    end
  end
end
