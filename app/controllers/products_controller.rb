class ProductsController < ApplicationController
  layout "user", only: [:index, :new, :show, :edit]

  def index
    session[:shopping_cart] ||= {}
    @categories = Category.all.map {|cat| [cat.name, cat.id]}
    selection = params[:category_id]
    if selection.nil?
      @products = Product.all
    else
      @products = Product.all.where("category_id == #{selection}")
    end
  end

  def create
    if session[:shopping_cart][params[:product_id]].nil?
      session[:shopping_cart][params[:product_id]] = 1
    else
      session[:shopping_cart][params[:product_id]] += 1
    end
    redirect_to root_path
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def list_of_category_names
    Category.all.each_with_object([]) do |cat, list|
      list << cat.name
    end
  end

  def whitelisted_product_params
    clean_up_money
    params.require(:product).permit(:name, :price, :category_id)
  end

  def clean_up_money
    params[:product][:price] = params[:product][:price][1..-1] if params[:product][:price][0] == "$"
  end
end
