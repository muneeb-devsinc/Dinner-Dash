class UserOrdersController < ApplicationController
  def index
    user = Order.where(user_id: current_user.id)
    @orders = params[:status] ? user.show_by_status(params[:status]).order_order : user.all_orders.order_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    if user_signed_in?
      @order = Order.find_by(id: session[:order_id])
      @order.user_id = current_user.id
      flash[:notice] = if @order.update(status: :ordered)
                         'Order Created'
                       else
                         'Order failed to Created'
                       end
      redirect_to items_path
    else
      redirect_to user_session_path
    end
  end
end
