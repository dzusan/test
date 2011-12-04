class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      #sign_in user
      #redirect_to user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Logged out!"
  end
end
