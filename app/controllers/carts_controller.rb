# frozen_string_literal: true

class CartsController < ApplicationController
  include Sessionable
  before_action :set_cart
  before_action :price_change
  before_action :show_line_total, :show_total
  after_action :destroy_empty_order, only: :destroy
  def show
    if @cart.nil?
      redirect_to items_path
      flash[:alert] = 'Cart is Empty'
    else
      @cart
    end
  end

  def update
    @carts = @cart.order_items.find_by(cart_params)
    if params[:increase]
      @carts.quantity += 1
    else
      @carts.quantity -= 1 unless @carts.quantity.zero?
    end
    @carts.save
    save_cart
    redirect_to cart_path
  end

  def destroy
    @carts = @cart.order_items.find_by(cart_params)
    @carts.destroy
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
    @cart = Order.find_by(id: session[:order_id], status: :inprogress) unless Order.find_by(id: session[:order_id], status: :inprogress).nil?
  end

  def show_line_total
    calculate_line_total unless @cart&.order_items.nil?
  end

  def calculate_line_total
    @cart.order_items.each do |item|
      item.total = item.unit_price * item.quantity
      item.save
    end
  end

  def show_total
    calculate_total unless @cart.nil?
  end

  def calculate_total
    @cart.total = @cart.order_items.map(&:total).inject(:+) unless @cart.nil?
    save_cart
  end

  def save_cart
    @cart.save
  end

  def price_change
    price_change_helper if @cart.present?
  end

  def price_change_helper
    @cart.order_items.each do |order_item|
      order_item.unit_price = order_item.item.price if order_item.unit_price != order_item.item.price
      order_item.save!
    end
  end
end
