class ShoppingCartsController < ApplicationController
  layout "cart", only: [:index, :new, :show, :edit]

  def edit
  end

  def new
  end

  def index
    @products = []
    session[:shopping_cart].each do |key,value|
      @products << [Product.find(key.to_i),value]
    end
  end

  def update
    if session[:shopping_cart][params[:product_id]].nil?
      session[:shopping_cart][params[:product_id]] = 1
    else
      session[:shopping_cart][params[:product_id]] += 1
    end
  end

  def show

  end

  def create
  end

  

  def destroy
  end
end
