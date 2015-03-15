class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      sign_in user
      flash[:success] = "Thanks for signing in!"
      redirect_to root_path
    else
      flash.now[:error] = "You dun goofed!"
      render :new
    end
  end

  def destroy
    user = current_user
    if sign_out
      flash[:success] = "Successfully signed out"
      redirect_to = root_path
    else
      flash[:error] = "Angry robots have prevented you from signing out"
      redirect_to root_path
    end
  end
end
