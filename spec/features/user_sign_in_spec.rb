require 'rails_helper'

feature 'User signs in' do

  # As a user
  # I want to sign in
  # So I can edit my albums and my profile
  #
  # Acceptance Criteria:
  #
  # * [X] There is a link to 'Sign in' in the header
  # * [X] If I fill in my email and password correctly, I am greeted and redirected
  # to my profile
  # * [X] If I input my password incorrectly, I am given an error message
  # * [X] If my email or password doesn't match an existing user, I get an error message
  # * [--] I can sign in using GitHub

  scenario 'User enters all information correctly' do
    existing_user = FactoryGirl.create(:user)

    visit root_path
    click_on "Sign In"

    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    click_on "Sign in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content existing_user.username
    expect(page).to have_content "Profile"
    expect(page).to have_content existing_user.email
  end

  scenario 'User inputs incorrect information' do
    visit root_path
    click_on 'Sign In'

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"

    expect(page).to have_content "Invalid email or password"
  end
end
