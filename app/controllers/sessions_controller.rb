class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "logged in"
    else
      flash[:alert] = "invalid log in credentials"
      render "new"      
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "successfully logged out"
  end
end

