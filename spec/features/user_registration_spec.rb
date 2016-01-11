require 'rails_helper'

feature 'user registration options', js: true do 
  scenario 'succesfully' do
    visit '/'
    click_link 'Sign up'  
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
    click_button 'Create User'
    
  end
  scenario 'invalid email' do
  end

  scenario 'duplicate email' do

  end
end