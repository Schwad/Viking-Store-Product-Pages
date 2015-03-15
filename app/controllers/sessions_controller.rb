class SessionsController < ApplicationController
  def create
    if session[:shopping_cart][params[:product_id]].nil?
      session[:shopping_cart][params[:product_id]] = 1
    else
      session[:shopping_cart][params[:product_id]] += 1
    end
    redirect_to root_path
  end

end
