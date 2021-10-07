# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :order
  before_action :initialize_order

  def create
    if @order_item.save
      session[:order_id] = @order.id
      flash.now[:notice] = 'Item added to cart'
      set_cart_count
    else
      flash.now[:alert] = 'Item could not be added to cart'
    end
    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
  end

  private

  def order_params
    params.permit(:item_id, :unit_price, :item_title)
  end

  def order
    @order ||= current_order
    @order.user_id = user_signed_in? ? current_user.id : guest_user.id
    @order.save
  end

  def initialize_order
    @order_item = @order.order_items.find_or_initialize_by(order_params)
  end

  def current_order
    if Order.find_by(id: session[:order_id], status: :in_progress).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id], status: :in_progress)
    end
  end
end
