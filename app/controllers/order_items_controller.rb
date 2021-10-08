# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :order
  before_action :initialize_order

  def create
    add_to_cart unless @order_item.nil?
    respond_to do |format|
      format.html { redirect_to items_path }
      format.js
    end
  end

  private

  def add_to_cart
    if @order_item.save
      session[:order_id] = @order.id
      flash.now[:notice] = 'Item added to cart'
      set_cart_count
    else
      flash.now[:alert] = 'Item could not be added to cart'
    end
  end

  def order_params
    params.permit(:item_id, :unit_price, :item_title)
  end

  def order
    @order ||= current_order
    @order.user_id = user_signed_in? ? current_user.id : guest_user.id
    @order.save
  end

  def initialize_order
    if @order.order_items.find_by(order_params).nil?
      @order_item = @order.order_items.new(order_params)
    else
      flash[:alert] = 'Item already added to cart'
    end
  end

  def current_order
    order = Order.find_by(id: session[:order_id], status: :in_progress)
    if order.nil?
      Order.new
    else
      order
    end
  end
end
