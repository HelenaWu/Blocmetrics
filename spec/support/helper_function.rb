def sign_up(email, password, password_confirm)
    visit '/'
    click_link 'Sign up'  

    within ".new_user" do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirm
    end
    click_button 'Create User'
end

def sign_in_manual(user)
  visit '/'
  click_link 'Log in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button "Log in"
end

def sign_in(user)
  #how to modify session variable?
end

def create_new_app(name, url)
  click_link "Create new"
  fill_in "Name", with: name
  fill_in "Url", with: url
  click_button "Create Registered application"
end