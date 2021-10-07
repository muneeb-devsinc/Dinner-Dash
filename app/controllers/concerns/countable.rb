# frozen_string_literal: true

module Countable
  def set_cart_count
    session[:cart_count] = Order.find_by(id: session[:order_id], status: :in_progress)&.order_items&.count.to_i
  end
end
