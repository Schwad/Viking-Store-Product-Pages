class ShoppingCartsController < ApplicationController

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

  def show

  end

  def create
  end

  def update
  end

  def destroy
  end
end
