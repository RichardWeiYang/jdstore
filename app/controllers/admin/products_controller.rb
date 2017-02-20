class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_param)
      flash[:notice] = "Product \'#{@product.title}\' information updated"
      redirect_to admin_products_path
    else
      flash[:warning] = "can't update product \'#{@product.title}\' information"
      render :edit
    end
  end

  def create
    @product = Product.new(product_param)

    if @product.save
      flash[:notice] = "Product \'#{@product.title}\' created"
      redirect_to admin_products_path
    else
      flash[:warning] = "can't create a new product"
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:warning] = "product \'#{@product.title}\' deleted"
    redirect_to admin_products_path
  end

  private

  def product_param
    params.require(:product).permit(:title, :description, :price, :quantity, :image)
  end
end
