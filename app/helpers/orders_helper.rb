module OrdersHelper
  def render_order_paid_state(order)
    if order.is_paid?
      "Paid"
    else
      "Not Paid"
    end
  end

  def render_order_created_time(order)
    order.created_at.to_s(:short)
  end
end
