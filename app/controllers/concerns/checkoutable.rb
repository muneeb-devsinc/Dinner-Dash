module Checkoutable
  def checkout
    @order = Order.find_by(id: session[:order_id])
    @order.user_id = current_user.id
    flash[:notice] = @order.update!(status: :order_placed) ? 'Order Created' : 'Order failed to Created'
  end
end
