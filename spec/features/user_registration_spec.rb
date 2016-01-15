require 'rails_helper'

feature 'user registration options', js: true do 
  scenario 'succesfully' do
    sign_up("test@example.com", "helloworld", "helloworld")
    expect(page).to have_content "please check your email to confirm your account"

    # open_email("test@example.com")
    # current_email.click_link "Complete sign up"
    # expect(page).to have_content "Thank you for confirming your account!"
  end
  scenario 'invalid email' do
    sign_up("test", "helloworld", "helloworld")
    expect(page).to have_content "Email is invalid"
  end

  scenario 'duplicate email' do
    email = "test@example.com"
    user = create(:user)
    sign_up(email, "helloworld", "helloworld")
    expect(page).to have_content "Email has already been taken"
  end
end