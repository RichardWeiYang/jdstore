module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "Paid"
    else
      "Not Paid"
    end
  end
end
