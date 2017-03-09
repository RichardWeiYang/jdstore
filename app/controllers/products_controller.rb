class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart]

  def index
    @products = Product.all
  end

  def show
  end

  def add_to_cart
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Added \'#{@product.title}\' to cart"
    else
      flash[:warning] = "You have already had \'#{@product.title}\' in cart"
    end
    redirect_to :back
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
