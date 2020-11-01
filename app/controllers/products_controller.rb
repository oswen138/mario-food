class ProductsController < ApplicationController

  before_action :only => [:new, :edit] do
    redirect_to new_user_session_path unless current_user && current_user.admin

  def index
    @products = Product.all
    @recent_products = Product.three_most_recent
    @most_reviewed_product = Product.most_reviewed
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:alert] = "Unable to add product, see error"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:alert] = "Unable to update product, see error"
      render :edit
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully removed!"
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
  end
end
