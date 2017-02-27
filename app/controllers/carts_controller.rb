class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "product deleted"
    redirect_to carts_path
  end

  def checkout
    flash[:notice] = "checkout"
    @order = Order.new
  end
end
