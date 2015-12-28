class ConfirmationsController < ApplicationController

  def update
    @user = User.find(params[:id])
    @user.confirm
    if @user.save
      flash[:notice] = "Thank you for confirming your account!"
      redirect_to root_url
    else
      flash[:error] = "Failed to confirm account"
      render :edit
    end
  end
end
