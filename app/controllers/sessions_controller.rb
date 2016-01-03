class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    logger.debug(user.inspect)

    if user && user.confirmed?
      session[:user_id] = user.id
      redirect_to root_url, :notice => "logged in"
    elsif user && !user.confirmed?
      flash[:alert] = "please check your email to complete sign up process"
      redirect_to sign_in_path
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

