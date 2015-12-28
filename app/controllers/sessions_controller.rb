class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    logger = Logger.new(STDOUT)
    logger.debug(user.confirm)
    raise

    if user && user.confirm == true
      session[:user_id] = user.id
      redirect_to root_url, :notice => "logged in"
    elsif user && user.confirm != true
      flash[:alert] = "please check your email to complete sign up process"
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
