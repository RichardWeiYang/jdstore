module CartsHelper
  def render_cart_total_price(cart)
    sum = 0
    cart.cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.product.price * cart_item.quantity
      end
    end
    sum
  end
end
