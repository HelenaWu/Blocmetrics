require 'rails_helper'

feature 'user register application', js: true do 
  scenario 'successful add application' do
    visit '/'
    user = create(:user)
    sign_in_manual(user)
    create_new_app("myApp", "myApp.com")
   
    expect(page).to have_content "successfully linked new application"
    expect(page).to have_content "myApp"
  end

  scenario 'duplicate application' do
    visit '/'
    user = create(:user)
    app = create(:registered_application, user: user)
    sign_in_manual(user)
    expect(page).to have_content "myApp"
    create_new_app("myApp", "myApp.com")
    expect(page).to have_content "Name has already been taken"
    expect(page).to have_content "Url has already been taken"
  end

  scenario 'verify event count' do
    user = create(:user)
    app = create(:registered_application, user: user)
    event = create(:event, registered_application: app)
    visit '/'
    sign_in_manual(user)
    expect(page).to have_content "myApp"
    click_link "myApp"    
    expect(page).to have_content "action100%"
  end

end