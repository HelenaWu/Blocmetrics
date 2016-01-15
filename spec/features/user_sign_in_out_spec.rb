require 'rails_helper'

feature 'user log in out', js: true do 
  scenario 'successful log in' do
    user = create(:user)
    visit '/'
    expect(page).to have_content "Log in"
    sign_in_manual(user)
    expect(page).not_to have_content "Log in"
    expect(page).to have_content "Logged in as #{user.email}"
  end

  scenario 'successful log out' do
    user = create(:user)
    visit '/'
    sign_in_manual(user)
    expect(page).to have_content "Log out"
    click_link "Log out"
    expect(page).not_to have_content "Log out"
  end

  scenario 'password reset' do
    visit '/'
    user = create(:user)
    click_link "forgot password?"
    fill_in "Email", with: user.email
    click_button "Reset Password"
    expect(page).to have_content "Email sent with password reset instructions."

    # open_email(user.email)
    # current_email.click_link "reset password now"
    # expect(page).to have_content "Reset your password"
    # fill_in "Password", with: user.password
    # fill_in "Password confirmation", with: user.password
    # click_button "Update Password"
    # expect(page).to have_content "password reset successful!"
  end

end