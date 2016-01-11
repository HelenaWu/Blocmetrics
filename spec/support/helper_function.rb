def manual_login_without_reg(email, password)
    sign_up(email, password)
    open_email email
    current_email.click_link "Confirm my account"
    expect(page).to have_content "Your email address has been successfully confirmed."
    login_with_prior_registration(email, password)
end
