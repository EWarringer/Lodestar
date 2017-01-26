require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

# Acceptance Criteria:
# * I must specify a valid email address,
#   password, and password confirmation
# * If I don't specify the required information, I am presented with
#   an error message

  scenario 'provide valid registration information' do
    visit root_path
    click_link "Sign Up"
    within('#new-user') do
      fill_in 'First Name', with: 'Jeff'
      fill_in 'Last Name', with: 'Sampson'
      fill_in 'Username', with: 'Swansonite11'
      fill_in 'Email', with: 'jeffsampson@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'

      click_button 'Sign up'
    end
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path
    within('#new-user') do
      click_button 'Sign up'
    end
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Username name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
