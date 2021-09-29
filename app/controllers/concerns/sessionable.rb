module Sessionable
  def current_order
    if Order.find_by(id: session[:order_id], status: :inprogress).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id], status: :inprogress)
    end
  end

  def user_logged
    current_order.user_id = current_user.id if user_signed_in?
  end
end
