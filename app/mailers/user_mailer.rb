class UserMailer < ActionMailer::Base
  default :from => 'helena@Blocmetrics.com'

  def send_signup_email(user)
    @user = user
    mail to: @user.email, subject: "Thanks for signing up!"
  end

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password Reset from Blocmetrics"
  end
end
