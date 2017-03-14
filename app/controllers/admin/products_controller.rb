class Admin::ProductsController < AdminController

  before_action :find_product, only: [:show, :edit, :update, :destroy, :move_up, :move_down]

  def index
    @products = Product.all.order("position ASC")
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update

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
    @product.destroy
    flash[:warning] = "product \'#{@product.title}\' deleted"
    redirect_to admin_products_path
  end

  def move_up
    @product.move_higher
    redirect_to admin_products_path
  end

  def move_down
    @product.move_lower
    redirect_to admin_products_path
  end

  private

  def product_param
    params.require(:product).permit(:title, :description, :price, :quantity, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
