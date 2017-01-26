require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can regain access to my account
} do
  # Acceptance Criteria
  # * As an authenticated user, I am able to sign in
  # * When I provide invalid information, I am shown an error message

  scenario 'specify valid credentials' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign out')
  end

  scenario 'specify invalid credentials' do
    visit root_path
    click_link 'Sign in'

    click_button 'Sign in'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to_not have_content('Sign out')
  end
end
