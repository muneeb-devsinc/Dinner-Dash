# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: %i[update destroy]
  before_action :price_change
  before_action :show_line_total
  before_action :show_total
  after_action :destroy_empty_order, only: :destroy

  def show
    @all_items = @cart.order_items.includes(:item).cart_order unless @cart.nil?
  end

  def update
    if params[:increase]
      @cart_item.quantity += 1
    else
      @cart_item.quantity -= 1 unless @cart_item.quantity.zero?
    end
    @cart_item.save

    save_cart

    redirect_to cart_path
  end

  def destroy
    if @cart_item.destroy
      flash[:notice] = 'Item Removed from cart successfully'
    else
      flash[:alert] = 'Error Removing Item'
    end

    redirect_to cart_path
  end

  private

  def destroy_empty_order
    set_cart
    @cart.destroy if @cart.order_items.blank?
  end

  def cart_params
    params.permit(:item_id)
  end

  def set_cart
    @cart = Order.find_by(id: session[:order_id], status: :in_progress) unless Order.find_by(id: session[:order_id], status: :in_progress).nil?
  end

  def show_line_total
    calculate_line_total unless @cart&.order_items.nil?
  end

  def calculate_line_total
    ActiveRecord::Base.transaction do
      @cart.order_items.each do |item|
        item.total = item.unit_price * item.quantity
        item.save
      end
    end
  end

  def show_total
    calculate_total unless @cart.nil?
  end

  def calculate_total
    ActiveRecord::Base.transaction do
      @cart.total = @cart.order_items.includes([:item]).map(&:total).inject(:+) unless @cart.nil?
      save_cart
    end
  end

  def save_cart
    @cart.save
  end

  def price_change
    price_change_helper if @cart.present?
  end

  def price_change_helper
    ActiveRecord::Base.transaction do
      @cart.order_items.includes([:item]).each do |order_item|
        order_item.unit_price = order_item.item.price if order_item.unit_price != order_item.item.price
        order_item.save
      end
    end
  end

  def set_cart_item
    @cart_item = @cart.order_items.find_by(cart_params)
  end
end
