class CartsController < ApplicationController
  include Sessionable
  before_action :set_cart
  before_action :show_line_total, :show_total
  def show
    @cart
  end

  def update
    @carts = @cart.order_items.find_by(item_id: params[:item_id])
    if params[:increase]
      @carts.increment!(:quantity)
    else
      @carts.decrement!(:quantity) unless @carts.quantity.zero?
    end
    save_cart
    redirect_to cart_path
  end

  def destroy
    @carts = @cart.order_items.find_by(item_id: params[:item_id])
    @carts.destroy
    redirect_to cart_path
  end

  private

  def set_cart
    @cart = Order.find_by(id: session[:order_id], status: :inprogress) unless Order.find_by(id: session[:order_id]).nil?
  end

  def show_line_total
    unless @cart&.order_items.nil?
      @cart.order_items.each do |item|
        item.total = item.unit_price * item.quantity
        item.save
      end
    end
  end

  def show_total
    unless @cart.nil?
      @cart.total = @cart.order_items.map(&:total).inject(:+) unless @cart.nil?
      save_cart
    end
  end

  def save_cart
    @cart.save
  end
end
