class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] Thanks for your order, following are details #{order.token}")
  end
end
