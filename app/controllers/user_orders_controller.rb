class UserOrdersController < ApplicationController
  def index
    authorize @orders, policy_class: UserOrderPolicy
    user = Order.where(user_id: current_user.id)
    @orders = params[:status] ? user.show_by_status(params[:status]).order_order : user.all_orders.order_order
  end

  def show
    @order = Order.find(params[:id])
    authorize @order, policy_class: UserOrderPolicy
  end

  def update
    if user_signed_in?
      @order = Order.find_by(id: session[:order_id])
      authorize @order, policy_class: UserOrderPolicy
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
