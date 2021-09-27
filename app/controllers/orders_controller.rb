class OrdersController < ApplicationController
  before_action :find_order, only: :show

  def show
    @order = find_order
  end

  private

  def find_order
    if user_signed_in?
      Order.find_by(user_id: current_user.id, status: :inprogress)
    else
      Order.find_by(id: session[:order_id], status: :inprogress)
    end
  end
end
