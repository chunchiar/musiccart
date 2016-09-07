class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find_by(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:image,:name,:description,:price)
  end

end
