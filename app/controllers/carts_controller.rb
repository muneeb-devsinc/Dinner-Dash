class CartsController < ApplicationController
  before_action :find_order
  include Sessionable
  def show
    @cart = @order
    if !@cart.nil?
      show_line_total
      show_total
    end
  end

  def update
    @cart = @order.order_items.find_by(item_id: params[:item_id])
    if params[:increase]
      @cart.increment!(:quantity)
    else
      @cart.decrement!(:quantity) unless @cart.quantity.zero?
    end
    @cart.save
    redirect_to cart_path
  end

  def destroy
    @cart = current_order.order_items.find_by(item_id: params[:item_id])
    @cart.destroy
    redirect_to cart_path
  end

  private

  def find_order
    @order = current_order
    @order.user_id = current_user.id if user_signed_in?
  end

  def show_line_total
    @cart.order_items.each do |item|
      item.total = item.unit_price * item.quantity
    end
  end

  def show_total
    @cart.total = @cart.order_items.map(&:total).inject(:+)
  end
end
