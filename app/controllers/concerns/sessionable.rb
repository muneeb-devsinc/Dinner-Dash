module Sessionable
  def current_order
    if Order.find_by(id: session[:order_id]).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id])
    end
  end
end
