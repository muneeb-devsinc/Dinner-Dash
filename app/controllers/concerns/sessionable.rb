# frozen_string_literal: true

module Sessionable
  def current_order
    if Order.find_by(id: session[:order_id], status: :inprogress).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id], status: :inprogress)
    end
  end
end
