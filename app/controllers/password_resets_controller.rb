class PasswordResetsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset 
      redirect_to root_url, notice: "Email sent with password reset instructions."
    else
      redirect_to new_password_reset_path, alert: "We couldn't find this user."
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:token])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:token])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired, please reset again."
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: "password reset successful!"
    else
      render :edit, error: 'failed to update password'
    end
  end

  private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
