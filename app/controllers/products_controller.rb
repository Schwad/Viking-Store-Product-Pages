class ProductsController < ApplicationController
  layout "user", only: [:index, :new, :show, :edit]

  def index
    @products = Product.all
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
